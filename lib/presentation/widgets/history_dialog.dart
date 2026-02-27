import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../data/models/receipt_history.dart';
import '../../logic/config_cubit/config_cubit.dart';
import '../../logic/config_cubit/config_state.dart';
import '../../logic/history_cubit/history_cubit.dart';
import '../../logic/history_cubit/history_state.dart';

class HistoryDialog extends StatefulWidget {
  const HistoryDialog({super.key});

  @override
  State<HistoryDialog> createState() => _HistoryDialogState();
}

class _HistoryDialogState extends State<HistoryDialog> {
  String _selectedProfile = 'ALL'; // 'ALL', 'NONE', or profileName
  final TextEditingController _searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Trigger load on init
    context.read<HistoryCubit>().loadHistory();
    _searchCtrl.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Historial de Recibos"),
      content: SizedBox(
        width: 600,
        height: 500,
        child: BlocBuilder<HistoryCubit, HistoryState>(
          builder: (context, state) {
            if (state is HistoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HistoryError) {
               return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
            } else if (state is HistoryLoaded) {
               if (state.history.isEmpty) return const Center(child: Text("No hay recibos guardados."));
               
               // Filter Logic
               final allHistory = state.history;
               
               // Gather all possible profiles
               final Set<String?> profileOptions = {};
               
               // 1. From Config
               final configState = context.read<ConfigCubit>().state;
               if (configState is ConfigLoaded) {
                 profileOptions.addAll(configState.allConfigs.map((c) => c.profileName).where((n) => n != null));
               }
               
               // 2. From History
               profileOptions.addAll(allHistory.map((e) => e.issuerProfileName).where((n) => n != null));
               
               final sortedProfiles = profileOptions.toList()..sort();
               final query = _searchCtrl.text.toLowerCase();

               List<ReceiptHistory> filtered = allHistory.where((e) {
                 final bool profileMatch = _selectedProfile == 'ALL' || e.issuerProfileName == _selectedProfile;
                 final bool searchMatch = query.isEmpty || 
                                          (e.payerName?.toLowerCase().contains(query) ?? false) || 
                                          (e.receiptNumber?.toLowerCase().contains(query) ?? false) ||
                                          (e.payerIdentifier?.toLowerCase().contains(query) ?? false);
                 return profileMatch && searchMatch;
               }).toList();

               return Column(
                 children: [
                   // Filter Dropdown
                   Padding(
                     padding: const EdgeInsets.only(bottom: 8.0),
                     child: Row(
                       children: [
                         const Text("Filtrar por Perfil: "),
                         const SizedBox(width: 8),
                         Expanded(
                           child: DropdownButton<String>(
                             value: _selectedProfile,
                             isExpanded: true,
                             items: [
                               const DropdownMenuItem(value: 'ALL', child: Text("Todos los perfiles")),
                               // Removed 'NONE'/Sin Perfil as requested
                               ...sortedProfiles.map((p) => DropdownMenuItem(value: p, child: Text(p!)))
                             ],
                             onChanged: (val) {
                               if (val != null) {
                                 setState(() {
                                   _selectedProfile = val;
                                 });
                               }
                             },
                           ),
                         ),
                       ],
                     ),
                   ),
                   // Search Bar
                   Padding(
                     padding: const EdgeInsets.only(bottom: 8.0),
                     child: TextField(
                       controller: _searchCtrl,
                       decoration: const InputDecoration(
                         labelText: "Buscar por nombre, DNI o número...",
                         prefixIcon: Icon(Icons.search),
                         isDense: true,
                         border: OutlineInputBorder(),
                       ),
                     ),
                   ),
                   const Divider(),

                   // List
                   Expanded(
                     child: filtered.isEmpty 
                       ? const Center(child: Text("No hay recibos para este filtro."))
                       : ListView.separated(
                         itemCount: filtered.length,
                         separatorBuilder: (c,i) => const Divider(),
                         itemBuilder: (context, index) {
                           final item = filtered[index];
                           return ListTile(
                             leading: const Icon(Icons.receipt_long, color: Colors.teal),
                             title: Text("Recibo N° ${item.receiptNumber ?? '---'}"),
                             subtitle: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Fecha: ${DateFormat('dd/MM/yyyy HH:mm').format(item.date)}"),
                                 Text("A nombre de: ${item.payerName ?? '---'}"),
                                 if (item.issuerProfileName != null)
                                   Text("Emisor: ${item.issuerProfileName}", style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 11)),
                               ],
                             ),
                             trailing: Row(
                               mainAxisSize: MainAxisSize.min,
                               children: [
                                 Text("S/. ${(item.totalAmount ?? 0).toStringAsFixed(2)}", style: const TextStyle(fontWeight: FontWeight.bold)),
                                 const SizedBox(width: 8),
                                 IconButton(
                                   icon: const Icon(Icons.open_in_new),
                                   tooltip: "Abrir PDF",
                                   onPressed: () {
                                     if (item.pdfPath != null) {
                                       context.read<HistoryCubit>().openReceiptPdf(item.pdfPath);
                                     } else {
                                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Ruta de archivo no disponible")));
                                     }
                                   },
                                 )
                               ],
                             ),
                           );
                         },
                       ),
                   ),
                 ],
               );
            }
            return const SizedBox();
          },
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cerrar")),
      ],
    );
  }
}
