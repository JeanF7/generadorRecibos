import 'package:flutter/material.dart';
import 'widgets/receipt_form_panel.dart';
import 'widgets/receipt_preview_panel.dart';

import 'widgets/history_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generador de Recibos"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: "Historial de Recibos",
            onPressed: () {
               showDialog(context: context, builder: (_) => const HistoryDialog());
            },
          )
        ],
      ),
      body: Row(
        children: [
          // Left Panel: Form & Controls (50%)
          const Expanded(
            flex: 1,
            child: ReceiptFormPanel()
          ),
           
          const VerticalDivider(width: 1),

          // Right Panel: Live Preview (50%)
          const Expanded(
            flex: 1,
            child: ReceiptPreviewPanel()
          ),
        ],
      ),
    );
  }
}
