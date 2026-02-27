import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import '../../data/models/organization_config.dart';
import '../../data/models/receipt_history.dart';
import '../../logic/config_cubit/config_cubit.dart';
import '../../logic/config_cubit/config_state.dart';
import '../../logic/receipt_form_cubit/receipt_form_cubit.dart';
import '../../logic/receipt_form_cubit/receipt_form_state.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../utils/receipt_pdf_generator.dart';
import '../../logic/people_list_cubit/people_list_cubit.dart';
import '../../logic/people_list_cubit/people_list_state.dart';
import 'package:open_filex/open_filex.dart';

class ReceiptPreviewPanel extends StatelessWidget {
  const ReceiptPreviewPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigCubit, ConfigState>(
      builder: (context, configState) {
        // Default Config
        OrganizationConfig config = OrganizationConfig();
        if (configState is ConfigLoaded) {
          config = configState.selectedConfig;
        }

        return BlocBuilder<ReceiptFormCubit, ReceiptFormState>(
          builder: (context, formState) {
            final receipt = formState.receipt;

            // Key forces rebuild when critical data changes if PdfPreview doesn't auto-update nicely
            // But PdfPreview `build` is called on refresh. We can just pass the params.
            
            return PdfPreview(
              build: (format) => ReceiptPdfGenerator.generate(format, receipt, config),
              canChangeOrientation: false,
              canChangePageFormat: false,
              allowPrinting: false, // User requested removal
              allowSharing: false, // User requested removal; functionality moved to Save
              initialPageFormat: PdfPageFormat.a4,
              // Setup actions to Save
              actions: [
                PdfPreviewAction(
                  icon: const Icon(Icons.save),
                  onPressed: (context, build, pageFormat) async {
                     // --- VALIDATIONS ---
                     final personName = receipt.payerName;
                     final personId = receipt.payerIdentifier;
                     final hasItems = receipt.items != null && receipt.items!.isNotEmpty;

                     if (personName == null || personName.isEmpty || personId == null || personId.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("⚠️ Debe seleccionar una persona (Nombre y DNI)"), backgroundColor: Colors.orange)
                        );
                        return;
                     }

                     if (!hasItems) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("⚠️ Debe agregar al menos un concepto/item"), backgroundColor: Colors.orange)
                        );
                        return;
                     }

                     // Strict List Check
                     final peopleState = context.read<PeopleListCubit>().state;
                     bool personExistsInList = false;
                     if (peopleState is PeopleListLoaded) {
                       personExistsInList = peopleState.allPeople.any((p) => 
                          p.name.toLowerCase() == personName.toLowerCase() && 
                          p.identifier == personId
                       );
                     } else {
                       // Assume loaded or skip check if not
                     }

                     if (!personExistsInList) {
                        showDialog(
                          context: context, 
                          builder: (_) => AlertDialog(
                            title: const Text("Persona no válida"),
                            content: const Text("El recibo solo puede generarse para una persona que esté en las listas importadas.\n\nEl nombre o DNI ingresado no coincide con ningún registro."),
                            actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))],
                          )
                        );
                        return;
                     }

                     // --- CONFIRM & SAVE PROCESS ---
                     bool confirm = await showDialog(
                       context: context,
                       builder: (context) => AlertDialog(
                         title: const Text("Confirmar Guardado"),
                         content: const Text("¿Está seguro de que desea guardar este recibo?"),
                         actions: [
                           TextButton(onPressed: () => Navigator.pop(context, false), child: const Text("Cancelar")),
                           ElevatedButton(onPressed: () => Navigator.pop(context, true), child: const Text("Guardar")),
                         ],
                       )
                     ) ?? false;

                     if (!confirm) return;

                     try {
                        // 0. Update Date to Now
                        final now = DateTime.now();
                        receipt.date = now; // Update local object for generation
                        context.read<ReceiptFormCubit>().updateDate(now); // Update state

                        // 1. Generate bytes
                        final bytes = await build(pageFormat);
                        
                        // 2. Get Directory (Portable)
                        final exeDir = File(Platform.resolvedExecutable).parent;
                        final receiptsDir = Directory('${exeDir.path}/receipts');
                        if (!await receiptsDir.exists()) {
                          await receiptsDir.create(recursive: true);
                        }
                        
                        // 3. Create Filename
                        final fileName = "recibo_${receipt.receiptNumber?.replaceAll(RegExp(r'[^\w\s]+'), '') ?? 'sin_numero'}_${DateTime.now().millisecondsSinceEpoch}.pdf";
                        final file = File('${receiptsDir.path}/$fileName');
                        
                        // 4. Write File
                        await file.writeAsBytes(bytes);
                        
                        // 5. Save to History
                        await context.read<ReceiptFormCubit>().saveReceipt(file.path, config.profileName);
                        
                        // 6. Success & Open PDF
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("✅ Recibo guardado: ${file.path}")));
                          
                          // Open PDF (Replacement for Share)
                          await OpenFilex.open(file.path);

                          // Clear Form
                          context.read<ReceiptFormCubit>().resetForm();
                          // Load next number for the new blank form
                          context.read<ReceiptFormCubit>().loadNextNumber(config.profileName);
                        }
                     } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error al guardar: $e"), backgroundColor: Colors.red));
                        }
                     }
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
