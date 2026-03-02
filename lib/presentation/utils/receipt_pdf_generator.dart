import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';
import '../../data/models/organization_config.dart';
import '../../data/models/receipt_history.dart';
import 'number_to_words.dart';

class ReceiptPdfGenerator {
  
  static Future<Uint8List> generate(
    PdfPageFormat format, 
    ReceiptHistory receipt, 
    OrganizationConfig config
  ) async {
    final pdf = pw.Document();
    
    // Load Logo if exists
    pw.MemoryImage? logoImage;
    if (config.logoPath != null && File(config.logoPath!).existsSync()) {
      try {
        final bytes = await File(config.logoPath!).readAsBytes();
        logoImage = pw.MemoryImage(bytes);
      } catch (_) {}
    }

    // Load Signature if exists
    pw.MemoryImage? signatureImage;
    if (config.signaturePath != null && File(config.signaturePath!).existsSync()) {
      try {
        final bytes = await File(config.signaturePath!).readAsBytes();
        signatureImage = pw.MemoryImage(bytes);
      } catch (_) {}
    }
    
    // Load Stamp if exists
    pw.MemoryImage? stampImage;
    if (config.stampPath != null && File(config.stampPath!).existsSync()) {
      try {
        final bytes = await File(config.stampPath!).readAsBytes();
        stampImage = pw.MemoryImage(bytes);
      } catch (_) {}
    }

    // await initializeDateFormatting('es'); // Ensure this is initialized in main or here if needed (but async here might be tricky if not awaited in main)
    final dateFormat = DateFormat("EEEE d 'de' MMMM 'del' y 'a las' hh:mm:ss a", 'es');

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Header
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                   // Left: Logo
                   pw.Expanded(
                     flex: 1,
                     child: pw.Align(
                       alignment: pw.Alignment.centerLeft,
                       child: logoImage != null 
                         ? pw.Container(
                             height: 80, 
                             width: 80, 
                             child: pw.Image(logoImage)
                           )
                         : pw.SizedBox(width: 80, height: 80),
                     ),
                   ),

                   // Center: Title "RECIBO"
                   pw.Expanded(
                     flex: 1,
                     child: pw.Center(
                       child: pw.Text("RECIBO", style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold))
                     ),
                   ),

                   // Right: Org Info
                   pw.Expanded(
                     flex: 1,
                     child: pw.Column(
                       crossAxisAlignment: pw.CrossAxisAlignment.end,
                       mainAxisAlignment: pw.MainAxisAlignment.center,
                       children: [
                         pw.Text(config.name ?? "Organization Name", style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold), textAlign: pw.TextAlign.right),
                         pw.Text(config.address ?? "Address", style: const pw.TextStyle(fontSize: 10), textAlign: pw.TextAlign.right),
                         if (config.taxId != null) 
                           pw.Text(
                             "${(config.isInstitution ?? false) ? 'Código Modular' : 'RUC'}: ${config.taxId}",
                              style: const pw.TextStyle(fontSize: 10), textAlign: pw.TextAlign.right
                           ),
                         if (config.phone != null) pw.Text("Tel: ${config.phone}", style: const pw.TextStyle(fontSize: 10), textAlign: pw.TextAlign.right),
                       ]
                     ),
                   ),
                ]
              ),
              pw.SizedBox(height: 30),

              // Info Row (Payer & Receipt Number)
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                   // Left: Payer Info
                   pw.Expanded(
                     child: pw.Column(
                       crossAxisAlignment: pw.CrossAxisAlignment.start,
                       children: [
                         pw.Row(
                           crossAxisAlignment: pw.CrossAxisAlignment.start,
                           children: [
                             pw.Text("Recibí de: ", style: const pw.TextStyle(fontSize: 12)),
                             pw.Expanded(
                               child: pw.Text(receipt.payerName ?? "Desconocido", style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold))
                             ),
                           ]
                         ),
                         if (receipt.payerIdentifier != null) 
                           pw.Padding(
                             padding: const pw.EdgeInsets.only(top: 2),
                             child: pw.Text("DNI/RUC: ${receipt.payerIdentifier}", style: const pw.TextStyle(fontSize: 10)),
                           ),
                       ]
                     ),
                   ),
                   pw.SizedBox(width: 20),
                   // Right: Receipt Number Box
                   pw.Container(
                     padding: const pw.EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                     decoration: pw.BoxDecoration(
                       color: PdfColors.white,
                       border: pw.Border.all(color: PdfColors.black, width: 1.5),
                       borderRadius: const pw.BorderRadius.all(pw.Radius.circular(4)),
                     ),
                     child: pw.Text(
                       "N° ${receipt.receiptNumber ?? '---'}", 
                       style: pw.TextStyle(color: PdfColors.black, fontWeight: pw.FontWeight.bold, fontSize: 14)
                     ),
                   )
                ]
              ),
              pw.SizedBox(height: 15),

              // Total in Words
              pw.Text(
                "La suma de: ${NumberToWords.convertToCustomFormat(receipt.totalAmount ?? 0)}",
                style: const pw.TextStyle(fontSize: 11),
              ),
              pw.SizedBox(height: 30),

              // Items Table Title
              pw.Text("Por los siguientes conceptos:", style: const pw.TextStyle(fontSize: 11)),
              pw.SizedBox(height: 5),

              // Items Table
              pw.Table(
                border: const pw.TableBorder(
                  bottom: pw.BorderSide(color: PdfColors.grey400, width: 0.5),
                  horizontalInside: pw.BorderSide(color: PdfColors.grey300, width: 0.5),
                  left: pw.BorderSide.none,
                  right: pw.BorderSide.none,
                  top: pw.BorderSide.none,
                  verticalInside: pw.BorderSide.none,
                ),
                columnWidths: {
                  0: const pw.FlexColumnWidth(3),      // Concepto
                  1: const pw.IntrinsicColumnWidth(),   // Cantidad
                  2: const pw.IntrinsicColumnWidth(),   // Monto
                },
                children: [
                  pw.TableRow(
                    decoration: const pw.BoxDecoration(color: PdfColors.white),
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(vertical: 8),
                        child: pw.Text('Concepto', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: pw.Text('Cantidad', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11), textAlign: pw.TextAlign.center),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(vertical: 8),
                        child: pw.Text('Monto (S/.)', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11), textAlign: pw.TextAlign.right),
                      ),
                    ]
                  ),
                  ...(receipt.items?.map((item) => pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(vertical: 8),
                        child: pw.Text(item.description ?? '', style: const pw.TextStyle(fontSize: 11)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: pw.Text(
                          item.quantity != null ? item.quantity!.toStringAsFixed(item.quantity == item.quantity!.roundToDouble() ? 0 : 2) : '1',
                          style: const pw.TextStyle(fontSize: 11),
                          textAlign: pw.TextAlign.center,
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(vertical: 8),
                        child: pw.Text(item.total.toStringAsFixed(2), style: const pw.TextStyle(fontSize: 11), textAlign: pw.TextAlign.right),
                      ),
                    ]
                  )).toList() ?? []),
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(vertical: 8),
                        child: pw.Text('TOTAL', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: pw.Text('', style: const pw.TextStyle(fontSize: 11)), // Celda vacía
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(vertical: 8),
                        child: pw.Text('S/. ${(receipt.totalAmount ?? 0).toStringAsFixed(2)}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11), textAlign: pw.TextAlign.right),
                      ),
                    ]
                  ),
                ]
              ),
              
              pw.SizedBox(height: 15),

              // Date alignment bottom right
              pw.Container(
                alignment: pw.Alignment.centerRight,
                child: pw.Text(
                  "${DateFormat("EEEE d 'de' MMMM 'de' y", 'es').format(receipt.date)}\n${DateFormat("hh:mm:ss a", 'es').format(receipt.date).toLowerCase()}",
                  style: const pw.TextStyle(fontSize: 10),
                  textAlign: pw.TextAlign.right
                )
              ),
              
              pw.SizedBox(height: 50), // Spacer before signature

               // Signature and Stamp section
               pw.Row(
                 mainAxisAlignment: pw.MainAxisAlignment.end,
                 children: [
                   pw.Column(
                     mainAxisAlignment: pw.MainAxisAlignment.end,
                     children: [
                       pw.Container(
                         width: 200, // Wider container to avoid any clipping issues
                         height: 75,
                         child: pw.Stack(
                           children: [
                             if (stampImage != null && signatureImage == null)
                               pw.Positioned(
                                 bottom: 0, left: 25, right: 25, // Center within the 150 area
                                 child: pw.Image(stampImage, fit: pw.BoxFit.contain)
                               ),
                             
                             if (signatureImage != null && stampImage == null)
                               pw.Positioned(
                                 bottom: 0, left: 25, right: 25, // Center within the 150 area
                                 child: pw.Image(signatureImage, fit: pw.BoxFit.contain)
                               ),
                             
                             if (stampImage != null && signatureImage != null)
                               pw.Positioned(
                                 right: 25, // Align to the right edge of the 150 area
                                 bottom: 0,
                                 child: pw.Container(
                                   width: 120,
                                   height: 70,
                                   child: pw.Image(signatureImage, fit: pw.BoxFit.contain),
                                 ),
                               ),
                               
                             if (stampImage != null && signatureImage != null)
                               pw.Positioned(
                                 left: 0, // Starts outside the 150 area (which starts at 25)
                                 bottom: 0,
                                 child: pw.Container(
                                   width: 70,
                                   height: 70,
                                   child: pw.Image(stampImage, fit: pw.BoxFit.contain),
                                 ),
                               ),
                           ],
                         ),
                       ),
                       pw.Container(width: 150, height: 1, color: PdfColors.black), // The 150px line centers inside the 200px column
                       pw.SizedBox(height: 5),
                       pw.Text("Firma y/o Sello", style: const pw.TextStyle(fontSize: 12)),
                     ]
                   )
                 ]
               ),
              
              pw.Spacer(),
              
              // Footer
              pw.Divider(),
              pw.Center(child: pw.Text(config.additionalInfo ?? "¡Gracias por su preferencia!", style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey600))),
            ]
          );
        }
      )
    );
    
    return pdf.save();
  }
}
