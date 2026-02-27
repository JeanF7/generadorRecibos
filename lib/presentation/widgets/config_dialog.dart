import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/local/file_helper.dart';
import '../../data/models/organization_config.dart';
import '../../logic/config_cubit/config_cubit.dart';
import '../../logic/config_cubit/config_state.dart';
import '../../logic/history_cubit/history_cubit.dart';
import '../../logic/people_list_cubit/people_list_cubit.dart';
import '../../logic/receipt_form_cubit/receipt_form_cubit.dart';
import '../../logic/auth_cubit/auth_cubit.dart'; // Added
import 'password_dialog.dart'; // Added

class ConfigDialog extends StatefulWidget {
  const ConfigDialog({super.key});

  @override
  State<ConfigDialog> createState() => _ConfigDialogState();
}

class _ConfigDialogState extends State<ConfigDialog> {
  final _formKey = GlobalKey<FormState>();
  
  // Controllers
  final _nameCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _taxCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _infoCtrl = TextEditingController();
  String? _logoPath;
  String? _signaturePath;
  String? _stampPath;
  bool _isInstitution = false;

  @override
  void initState() {
    super.initState();
    _loadCurrentState();
  }
  
  void _loadCurrentState() {
     final state = context.read<ConfigCubit>().state;
     if (state is ConfigLoaded) {
       _populateForm(state.selectedConfig);
     }
  }
  
  void _populateForm(OrganizationConfig config) {
     _nameCtrl.text = config.name ?? "";
     _addressCtrl.text = config.address ?? "";
     _taxCtrl.text = config.taxId ?? "";
     _phoneCtrl.text = config.phone ?? "";
     _infoCtrl.text = config.additionalInfo ?? "";
     setState(() {
       _logoPath = config.logoPath;
       _signaturePath = config.signaturePath;
       _stampPath = config.stampPath;
       _isInstitution = config.isInstitution ?? false;
     });
  }
  
  void _clearForm() {
    _nameCtrl.clear();
    _addressCtrl.clear();
    _taxCtrl.clear();
    _phoneCtrl.clear();
    _infoCtrl.clear();
    setState(() {
      _logoPath = null;
      _signaturePath = null;
      _stampPath = null;
      _isInstitution = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConfigCubit, ConfigState>(
      listener: (context, state) {
        if (state is ConfigLoaded) {
          _populateForm(state.selectedConfig);
        }
      },
      builder: (context, state) {
        if (state is ConfigLoading) return const Center(child: CircularProgressIndicator());
        if (state is ConfigLoaded) {
          return AlertDialog(
            title: const Text("Configuración de Perfiles"),
            content: SizedBox(
               width: 800,
               height: 500,
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   // Left Sidebar: Profile List
                   Expanded(
                     flex: 1,
                     child: Container(
                       decoration: BoxDecoration(
                         border: Border(right: BorderSide(color: Colors.grey.shade300))
                       ),
                       child: Column(
                         children: [
                           ListTile(
                             title: const Text("Perfiles", style: TextStyle(fontWeight: FontWeight.bold)),
                             trailing: IconButton(
                               icon: const Icon(Icons.add),
                               tooltip: "Crear Nuevo Perfil",
                               onPressed: _showCreateProfileDialog,
                             ),
                           ),
                           Expanded(
                             child: ListView.builder(
                               itemCount: state.allConfigs.length,
                               itemBuilder: (context, index) {
                                 final cfg = state.allConfigs[index];
                                 final isSelected = cfg.id == state.selectedConfig.id;
                                 return ListTile(
                                   selected: isSelected,
                                   selectedTileColor: Colors.blue.withOpacity(0.1),
                                   title: Text(cfg.profileName ?? "Sin nombre"),
                                   subtitle: Text(cfg.name ?? ""),
                                   onTap: () {
                                     context.read<ConfigCubit>().loadConfig(cfg.id);
                                   },
                                   trailing: (state.allConfigs.length > 1) 
                                     ? IconButton(
                                         icon: const Icon(Icons.delete, size: 16),
                                         onPressed: () => context.read<ConfigCubit>().deleteConfig(cfg.id),
                                       )
                                     : null,
                                 );
                               },
                             ),
                           ),
                           const Divider(),
                           ListTile(
                             leading: const Icon(Icons.key),
                             title: const Text("Cambiar Contraseña", style: TextStyle(fontSize: 12)),
                             onTap: _showChangePasswordDialog,
                           ),
                           ListTile(
                             leading: const Icon(Icons.dangerous, color: Colors.red),
                             title: const Text("ELIMINAR TODO", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12)),
                             onTap: _confirmClearAll,
                           ),
                           const SizedBox(height: 10),
                         ],
                       ),
                     )
                   ),
                   // Right Content: Form
                   Expanded(
                     flex: 2,
                     child: Padding(
                       padding: const EdgeInsets.only(left: 16.0),
                       child: _buildForm(state.selectedConfig),
                     )
                   )
                 ],
               ),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cerrar")),
              ElevatedButton(
                onPressed: () => _saveCurrent(state.selectedConfig),
                child: const Text("Guardar Cambios"),
              )
            ],
          );
        }
        return const AlertDialog(content: Text("Error de estado"));
      },
    );
  }
  
  Widget _buildForm(OrganizationConfig config) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
             Row(
               children: [
                 Text("Editando: ${config.profileName ?? 'Perfil'}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                 const Spacer(),
                 TextButton.icon(
                   icon: const Icon(Icons.cleaning_services),
                   label: const Text("Limpiar campos"),
                   onPressed: _clearForm,
                 )
               ],
             ),
             const Divider(),
             const SizedBox(height: 10),
             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 GestureDetector(
                    onTap: () async {
                      FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
                      if (result != null && mounted) {
                        setState(() { _logoPath = result.files.single.path; });
                      }
                    },
                    child: Container(
                      height: 100, 
                      width: 100, 
                      color: Colors.grey[200],
                      child: _logoPath != null 
                        ? Image.file(File(_logoPath!), fit: BoxFit.cover, errorBuilder: (c,e,s) => const Icon(Icons.broken_image))
                        : const Icon(Icons.add_a_photo),
                    ),
                 ),
                 if (_logoPath != null)
                   TextButton(onPressed: () => setState(() => _logoPath = null), child: const Text("Borrar")),
                 const SizedBox(width: 16),
                 Expanded(
                   child: Column(
                     children: [
                       SwitchListTile(
                         title: const Text("Es Institución"),
                         value: _isInstitution,
                         onChanged: (val) {
                           setState(() {
                             _isInstitution = val;
                           });
                         }
                       ),
                        TextFormField(
                          controller: _nameCtrl,
                          decoration: const InputDecoration(labelText: "Nombre Institución", isDense: true),
                          validator: (v) => v!.isEmpty ? "Requerido" : null,
                        ),
                        TextFormField(
                          controller: _taxCtrl,
                          decoration: InputDecoration(
                            labelText: _isInstitution ? "Código Modular" : "RUC / ID",
                            isDense: true
                          ),
                        ),
                     ],
                   )
                 )
               ],
             ),
             const SizedBox(height: 16),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Column(
                   children: [
                     const Text("Firma (Opcional)", style: TextStyle(fontSize: 12)),
                     const SizedBox(height: 5),
                     GestureDetector(
                        onTap: () async {
                          FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
                          if (result != null && mounted) {
                            setState(() { _signaturePath = result.files.single.path; });
                          }
                        },
                        child: Container(
                          height: 80, 
                          width: 150, 
                          color: Colors.grey[200],
                          child: _signaturePath != null 
                            ? Image.file(File(_signaturePath!), fit: BoxFit.contain, errorBuilder: (c,e,s) => const Icon(Icons.broken_image))
                            : const Icon(Icons.add_a_photo, color: Colors.grey),
                        ),
                     ),
                     if (_signaturePath != null)
                       TextButton(onPressed: () => setState(() => _signaturePath = null), child: const Text("Quitar", style: TextStyle(fontSize: 10))),
                   ],
                 ),
                 Column(
                   children: [
                     const Text("Sello (Opcional)", style: TextStyle(fontSize: 12)),
                     const SizedBox(height: 5),
                     GestureDetector(
                        onTap: () async {
                          FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
                          if (result != null && mounted) {
                            setState(() { _stampPath = result.files.single.path; });
                          }
                        },
                        child: Container(
                          height: 80, 
                          width: 80, 
                          color: Colors.grey[200],
                          child: _stampPath != null 
                            ? Image.file(File(_stampPath!), fit: BoxFit.contain, errorBuilder: (c,e,s) => const Icon(Icons.broken_image))
                            : const Icon(Icons.add_a_photo, color: Colors.grey),
                        ),
                     ),
                     if (_stampPath != null)
                       TextButton(onPressed: () => setState(() => _stampPath = null), child: const Text("Quitar", style: TextStyle(fontSize: 10))),
                   ],
                 ),
               ],
             ),
             const SizedBox(height: 16),
             TextFormField(controller: _addressCtrl, decoration: const InputDecoration(labelText: "Dirección")),
             TextFormField(controller: _phoneCtrl, decoration: const InputDecoration(labelText: "Teléfono")),
             TextFormField(controller: _infoCtrl, decoration: const InputDecoration(labelText: "Info Adicional"), maxLines: 2),
          ],
        ),
      ),
    );
  }
  
  void _saveCurrent(OrganizationConfig original) async {
     if (_formKey.currentState!.validate()) {
       
       // Handle Image Copying & Deletion of old ones if changed
       String? newLogoPath = _logoPath;
       if (_logoPath != original.logoPath) {
         newLogoPath = await FileHelper.copyImageToLocal(_logoPath);
         if (original.logoPath != null) await FileHelper.deleteLocalImage(original.logoPath);
       }
       
       String? newSignaturePath = _signaturePath;
       if (_signaturePath != original.signaturePath) {
         newSignaturePath = await FileHelper.copyImageToLocal(_signaturePath);
         if (original.signaturePath != null) await FileHelper.deleteLocalImage(original.signaturePath);
       }
       
       String? newStampPath = _stampPath;
       if (_stampPath != original.stampPath) {
         newStampPath = await FileHelper.copyImageToLocal(_stampPath);
         if (original.stampPath != null) await FileHelper.deleteLocalImage(original.stampPath);
       }

       // Update original object with new values (Isar objects are mutable usually, but better to clone if using copyWith, here we mutate)
       original.name = _nameCtrl.text;
       original.address = _addressCtrl.text;
       original.taxId = _taxCtrl.text;
       original.phone = _phoneCtrl.text;
       original.additionalInfo = _infoCtrl.text;
       original.logoPath = newLogoPath;
       original.signaturePath = newSignaturePath;
       original.stampPath = newStampPath;
       original.isInstitution = _isInstitution;
       
       if (mounted) {
         context.read<ConfigCubit>().saveConfig(original);
         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Guardado")));
       }
     }
  }

  void _showCreateProfileDialog() {
     final ctrl = TextEditingController();
     showDialog(
       context: context,
       builder: (ctx) => AlertDialog(
         title: const Text("Nuevo Perfil"),
         content: TextField(controller: ctrl, decoration: const InputDecoration(labelText: "Nombre del Perfil")),
         actions: [
           TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Cancelar")),
           ElevatedButton(
             onPressed: () {
               if (ctrl.text.isNotEmpty) {
                 context.read<ConfigCubit>().createProfile(ctrl.text);
                 Navigator.pop(ctx);
               }
             },
             child: const Text("Crear")
           )
         ],
       )
     );
  }

  void _showChangePasswordDialog() {
    final oldCtrl = TextEditingController();
    final newCtrl = TextEditingController();
    
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Cambiar Contraseña"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: oldCtrl, obscureText: true, decoration: const InputDecoration(labelText: "Contraseña Actual")),
            const SizedBox(height: 10),
            TextField(controller: newCtrl, obscureText: true, decoration: const InputDecoration(labelText: "Nueva Contraseña")),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Cancelar")),
          ElevatedButton(
            onPressed: () async {
              if (oldCtrl.text.isEmpty || newCtrl.text.isEmpty) return;
              
              final result = await context.read<AuthCubit>().changePassword(oldCtrl.text, newCtrl.text);
              if (result && mounted) {
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Contraseña Actualizada")));
              } else if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error: Contraseña actual incorrecta"), backgroundColor: Colors.red));
              }
            },
            child: const Text("Actualizar")
          )
        ],
      )
    );
  }

  void _confirmClearAll() async {
    // 1. First warning
    final confirm1 = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("¿ELIMINAR TODO?", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        content: const Text("Esta acción eliminará TODOS los perfiles, historial de recibos, listas de personas y configuraciones.\n\nNO SE PUEDE DESHACER.\n\n¿Desea continuar?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text("Cancelar")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text("SÍ, Continuar"),
          )
        ],
      )
    );

    if (confirm1 != true) return;

    // 2. Password Check (Double)
    if (!mounted) return;
    final allowed = await showDialog<bool>(
       context: context,
       builder: (_) => const PasswordDialog(
         title: "Confirmación de Seguridad",
         message: "Para eliminar todos los datos, ingrese su contraseña:",
         doubleCheck: true
       )
    );

    if (allowed != true) return;

    // 3. Execute
    if (!mounted) return;
    await context.read<ConfigCubit>().wipeData();
    
    if (mounted) {
      // Refresh other states to empty
      context.read<PeopleListCubit>().loadPeople();
      context.read<HistoryCubit>().loadHistory();
      context.read<ReceiptFormCubit>().resetForm();
      
      Navigator.pop(context); // Close Config Dialog
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("⚠️ Todos los datos han sido eliminados.")));
    }
  }

}
