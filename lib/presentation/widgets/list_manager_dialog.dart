import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/person.dart';
import '../../data/services/excel_service.dart';
import '../../logic/people_list_cubit/people_list_cubit.dart';
import '../../logic/people_list_cubit/people_list_state.dart';

class ListManagerDialog extends StatefulWidget {
  const ListManagerDialog({super.key});

  @override
  State<ListManagerDialog> createState() => _ListManagerDialogState();
}

class _ListManagerDialogState extends State<ListManagerDialog> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  // Import State
  String? _selectedFilePath;
  List<int>? _fileBytes;
  List<String> _headers = [];
  Map<String, int> _mapping = {};
  final _listNameCtrl = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Gestor de Listas (Personas/Padres)"),
      content: SizedBox(
        width: 700,
        height: 600,
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: "Listas Guardadas"),
                Tab(text: "Importar Excel"),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildListTab(),
                  _buildImportTab(),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cerrar")),
      ],
    );
  }

  Widget _buildListTab() {
    return BlocBuilder<PeopleListCubit, PeopleListState>(
      builder: (context, state) {
        if (state is PeopleListLoading) return const Center(child: CircularProgressIndicator());
        if (state is PeopleListLoaded) {
          final grouped = state.grouped;
          if (grouped.isEmpty) return const Center(child: Text("No hay listas importadas"));
          
          return ListView.builder(
            itemCount: grouped.keys.length,
            itemBuilder: (context, index) {
              final listName = grouped.keys.elementAt(index);
              final people = grouped[listName]!;
              
              return ExpansionTile(
                title: Text("$listName (${people.length})"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.person_add, color: Colors.blue),
                      tooltip: "Agregar Persona a esta lista",
                      onPressed: () {
                         final nameCtrl = TextEditingController();
                         final idCtrl = TextEditingController();
                         
                         showDialog(context: context, builder: (ctx) => AlertDialog(
                           title: Text("Agregar a $listName"),
                           content: Column(
                             mainAxisSize: MainAxisSize.min,
                             children: [
                               TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: "Nombre")),
                               TextField(controller: idCtrl, decoration: const InputDecoration(labelText: "DNI / Identificador")),
                             ],
                           ),
                           actions: [
                             TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Cancelar")),
                             ElevatedButton(
                               onPressed: () {
                                 if (nameCtrl.text.isNotEmpty) {
                                   final p = Person()
                                     ..name = nameCtrl.text
                                     ..identifier = idCtrl.text
                                     ..listName = (listName == 'Otros' ? null : listName); // Handle 'Otros' as null
                                     
                                   context.read<PeopleListCubit>().addPerson(p);
                                   Navigator.pop(ctx);
                                 }
                               }, 
                               child: const Text("Agregar")
                             )
                           ],
                         ));
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_forever, color: Colors.red),
                      tooltip: "Eliminar Lista",
                      onPressed: () {
                         showDialog(context: context, builder: (ctx) => AlertDialog(
                           title: const Text("Confirmar Eliminación"),
                           content: Text("¿Eliminar lista '$listName' y sus miembros?"),
                           actions: [
                             TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Cancelar")),
                             TextButton(onPressed: () {
                               context.read<PeopleListCubit>().deleteList(listName);
                               Navigator.pop(ctx);
                             }, child: const Text("Eliminar", style: TextStyle(color: Colors.red)))
                           ],
                         ));
                      },
                    ),
                    const Icon(Icons.expand_more)
                  ],
                ),
                children: people.map((p) => ListTile(
                  dense: true,
                  title: Text(p.name ?? ""),
                  subtitle: Text(p.identifier ?? ""),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, size: 16, color: Colors.blueGrey),
                        tooltip: "Editar Persona",
                        onPressed: () {
                           // Show Edit Dialog
                           final nameCtrl = TextEditingController(text: p.name);
                           final idCtrl = TextEditingController(text: p.identifier);
                           
                           showDialog(context: context, builder: (ctx) => AlertDialog(
                             title: const Text("Editar Persona"),
                             content: Column(
                               mainAxisSize: MainAxisSize.min,
                               children: [
                                 TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: "Nombre")),
                                 const SizedBox(height: 10),
                                 TextField(controller: idCtrl, decoration: const InputDecoration(labelText: "DNI / Identificador")),
                               ],
                             ),
                             actions: [
                               TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Cancelar")),
                               ElevatedButton(
                                 onPressed: () {
                                   if (nameCtrl.text.isNotEmpty) {
                                     // Update existing object
                                     p.name = nameCtrl.text;
                                     p.identifier = idCtrl.text;
                                     // List Name remains same
                                     
                                     context.read<PeopleListCubit>().updatePerson(p);
                                     Navigator.pop(ctx);
                                   }
                                 }, 
                                 child: const Text("Guardar")
                               )
                             ],
                           ));
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, size: 16, color: Colors.red),
                        onPressed: () => context.read<PeopleListCubit>().deletePerson(p.id),
                      ),
                    ],
                  ),
                )).toList(),
              );
            },
          );
        }
        return const Center(child: Text("Error al cargar listas"));
      },
    );
  }

  Widget _buildImportTab() {
     return SingleChildScrollView(
       padding: const EdgeInsets.all(16),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           ElevatedButton.icon(
             icon: const Icon(Icons.upload_file),
             label: const Text("Seleccionar Archivo Excel (.xlsx)"),
             onPressed: () async {
               FilePickerResult? result = await FilePicker.platform.pickFiles(
                 type: FileType.custom,
                 allowedExtensions: ['xlsx', 'xls'],
                 withData: true 
               );
               
               if (result != null && mounted) {
                 final bytes = File(result.files.single.path!).readAsBytesSync();
                 final headers = context.read<ExcelService>().getHeaders(bytes);
                 
                 setState(() {
                   _selectedFilePath = result.files.single.path;
                   _fileBytes = bytes;
                   _headers = headers;
                   _mapping = {}; 
                   
                   // Default list name from filename
                   final fname = result.files.single.name;
                   _listNameCtrl.text = fname.replaceAll(".xlsx", "").replaceAll(".xls", "");
                 });
               }
             },
           ),
           const SizedBox(height: 10),
           if (_selectedFilePath != null) Text("Archivo: $_selectedFilePath"),
           const SizedBox(height: 20),
           
           if (_headers.isNotEmpty) ...[
             TextField(
               controller: _listNameCtrl,
               decoration: const InputDecoration(
                 labelText: "Nombre de la Lista",
                 hintText: "Ej. Padres 2024",
                 border: OutlineInputBorder()
               ),
             ),
             const SizedBox(height: 20),
             const Text("Mapeo de Columnas:", style: TextStyle(fontWeight: FontWeight.bold)),
             const SizedBox(height: 10),
             _buildMappingRow("Nombre (Requerido)", "name"),
             _buildMappingRow("DNI / Identificador", "identifier"),
             
             const SizedBox(height: 20),
             Center(
               child: ElevatedButton(
                 style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white),
                 onPressed: () {
                   if (!_mapping.containsKey('name')) {
                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Debes mapear la columna Nombre")));
                     return;
                   }
                   if (_listNameCtrl.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Debes asignar un nombre a la lista")));
                      return;
                   }
                   
                   context.read<PeopleListCubit>().importPeople(
                     _fileBytes!, 
                     _mapping, 
                     _listNameCtrl.text
                   );
                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Importación finalizada")));
                   _tabController.animateTo(0); 
                 },
                 child: const Text("Importar Datos"),
               ),
             )
           ] 
         ],
       ),
     );
  }
  
  Widget _buildMappingRow(String label, String key) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          const SizedBox(width: 10),
          DropdownButton<int>(
             hint: const Text("Seleccionar Columna"),
             value: _mapping[key],
             items: _headers.asMap().entries.map((e) => DropdownMenuItem(
               value: e.key,
               child: Text(e.value.isEmpty ? "Col ${e.key}" : e.value),
             )).toList(),
             onChanged: (val) {
               setState(() {
                 if (val != null) _mapping[key] = val;
               });
             },
          ),
        ],
      ),
    );
  }
}
