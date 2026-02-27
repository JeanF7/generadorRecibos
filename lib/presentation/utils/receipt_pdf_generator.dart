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
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  if (logoImage != null) 
                    pw.Container(
                      height: 100, 
                      width: 100, 
                      child: pw.Image(logoImage)
                    ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text(config.name ?? "Organization Name", style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
                      pw.Text(config.address ?? "Address", style: const pw.TextStyle(fontSize: 12)),
                      if (config.taxId != null) 
                        pw.Text(
                          "${(config.isInstitution ?? false) ? 'Código Modular' : 'RUC'}: ${config.taxId}",
                           style: const pw.TextStyle(fontSize: 12)
                        ),
                      if (config.phone != null) pw.Text("Tel: ${config.phone}", style: const pw.TextStyle(fontSize: 12)),
                    ]
                  )
                ]
              ),
              pw.SizedBox(height: 20),
              
              // Title
              pw.Center(
                child: pw.Text("RECIBO", style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold))
              ),
              pw.SizedBox(height: 20),

              // Info Row
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                   pw.Column(
                     crossAxisAlignment: pw.CrossAxisAlignment.start,
                     children: [
                       pw.Text("Recibido De:"),
                       pw.Text(receipt.payerName ?? "Desconocido", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                       if (receipt.payerIdentifier != null) pw.Text("DNI/RUC: ${receipt.payerIdentifier}"),
                     ]
                   ),
                   pw.Column(
                     crossAxisAlignment: pw.CrossAxisAlignment.end,
                     children: [
                       pw.Text("Recibo N°: ${receipt.receiptNumber ?? '---'}"),
                       pw.Text("Fecha: ${dateFormat.format(receipt.date)}"),
                     ]
                   )
                ]
              ),
              pw.SizedBox(height: 30),

              // Items Table
              pw.Table.fromTextArray(
                context: context,
                border: null,
                headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
                cellHeight: 30,
                cellAlignments: {
                  0: pw.Alignment.centerLeft,
                  1: pw.Alignment.centerRight,
                  2: pw.Alignment.centerRight,
                  3: pw.Alignment.centerRight,
                },
                headers: <String>['Descripción', 'Cantidad', 'Precio Unit.', 'Total'],
                data: <List<String>>[
                  ...receipt.items?.map((item) => [
                    item.description ?? '',
                    item.quantity?.toStringAsFixed(2) ?? '0',
                    item.unitPrice?.toStringAsFixed(2) ?? '0.00',
                    item.total.toStringAsFixed(2)
                  ]) ?? []
                ]
              ),
              
              pw.Divider(),
              
              // Total
              pw.Row(
                 mainAxisAlignment: pw.MainAxisAlignment.end,
                 children: [
                   pw.Column(
                     crossAxisAlignment: pw.CrossAxisAlignment.end,
                     children: [
                        pw.Row(
                          mainAxisSize: pw.MainAxisSize.min,
                          children: [
                            pw.Text("TOTAL: ", style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
                            pw.Text("S/. ${(receipt.totalAmount ?? 0).toStringAsFixed(2)}", style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold))
                          ]
                        ),
                        pw.Text(
                          "SON: (${NumberToWords.convertLower(receipt.totalAmount ?? 0)})",
                          style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey700)
                        )
                     ]
                   )
                 ]
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
