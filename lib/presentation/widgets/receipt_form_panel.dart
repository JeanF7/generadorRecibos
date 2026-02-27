import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../data/models/person.dart';
import '../../data/models/receipt_item.dart';
import '../../data/models/receipt_item.dart';
import '../../logic/config_cubit/config_cubit.dart';
import '../../logic/config_cubit/config_state.dart';
import '../../logic/people_list_cubit/people_list_cubit.dart';
import '../../logic/people_list_cubit/people_list_state.dart';
import '../../logic/receipt_form_cubit/receipt_form_cubit.dart';
import '../../logic/receipt_form_cubit/receipt_form_state.dart';
import 'config_dialog.dart';
import 'list_manager_dialog.dart';
import 'password_dialog.dart'; // Added

class ReceiptFormPanel extends StatefulWidget {
  const ReceiptFormPanel({super.key});

  @override
  State<ReceiptFormPanel> createState() => _ReceiptFormPanelState();
}

class _ReceiptFormPanelState extends State<ReceiptFormPanel> {
  final _amountCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  final _priceCtrl = TextEditingController();
  final _nameCtrl = TextEditingController(); // Added
  final _nameFocus = FocusNode(); // Fix for Autocomplete assertion

  // V2: List Filtering
  String? _selectedListFilter;
  
  // V2.1: DNI Controller & Focus
  final _dniCtrl = TextEditingController();
  final _dniFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _dniFocus.addListener(_onDniFocusChange);
    
    // Initial load of receipt number
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final configState = context.read<ConfigCubit>().state;
      String? profileName;
      if (configState is ConfigLoaded) {
        profileName = configState.selectedConfig.profileName;
      }
      context.read<ReceiptFormCubit>().loadNextNumber(profileName);
    });
  }

  @override
  void dispose() {
    _dniFocus.removeListener(_onDniFocusChange);
    _dniFocus.dispose();
    _dniCtrl.dispose();
    _nameCtrl.dispose(); 
    _nameFocus.dispose(); // Fix cleanup
    _amountCtrl.dispose();
    _descCtrl.dispose();
    _priceCtrl.dispose();
    super.dispose();
  }

  void _onDniFocusChange() {
    if (!_dniFocus.hasFocus) {
       // Focus lost, update cubit
       context.read<ReceiptFormCubit>().updatePayerIdentifier(_dniCtrl.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Toolbar
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.settings),
                label: const Text("Configuración"),
                onPressed: () async {
                  final allowed = await showDialog(context: context, builder: (_) => const PasswordDialog());
                  if (allowed == true && context.mounted) {
                    showDialog(context: context, builder: (_) => const ConfigDialog());
                  }
                },
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                icon: const Icon(Icons.list),
                label: const Text("Gestor de Listas"),
                onPressed: () async {
                  final allowed = await showDialog(context: context, builder: (_) => const PasswordDialog());
                  if (allowed == true && context.mounted) {
                    showDialog(context: context, builder: (_) => const ListManagerDialog());
                  }
                },
              ),
            ],
          ),
        ),
        const Divider(),

        // Form Content
        Expanded(
          child: MultiBlocListener(
            listeners: [
              BlocListener<ConfigCubit, ConfigState>(
                listener: (context, configState) {
                  if (configState is ConfigLoaded) {
                     context.read<ReceiptFormCubit>().loadNextNumber(configState.selectedConfig.profileName);
                  }
                },
              ),
              BlocListener<ReceiptFormCubit, ReceiptFormState>(
                listener: (context, state) {
                  // Check if form was reset
                  if (state.receipt.items?.isEmpty == true && state.receipt.payerName == null && state.receipt.payerIdentifier == null) {
                    _amountCtrl.clear();
                    _descCtrl.clear();
                    _priceCtrl.clear();
                    _dniCtrl.clear();
                    _nameCtrl.clear(); // Added
                  }
                },
              ),
            ],
            child: BlocBuilder<ReceiptFormCubit, ReceiptFormState>(
            builder: (context, state) {
              final receipt = state.receipt;
              final dateFormat = DateFormat('yyyy-MM-dd');
              
              // Sync DNI controller if needed (one-way from state to ctrl if not focused)
              if (!_dniFocus.hasFocus && _dniCtrl.text != receipt.payerIdentifier) {
                 _dniCtrl.text = receipt.payerIdentifier ?? "";
              }

              return ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  // Date & Number
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(labelText: "Fecha", suffixIcon: Icon(Icons.calendar_today)),
                          readOnly: true,
                          controller: TextEditingController(text: dateFormat.format(receipt.date)),
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context, 
                              initialDate: receipt.date, 
                              firstDate: DateTime(2000), 
                              lastDate: DateTime(2100)
                            );
                            if (date != null && context.mounted) {
                              context.read<ReceiptFormCubit>().updateDate(date);
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          // Read-only/Auto-generated
                          key: ValueKey(receipt.receiptNumber), // Update when value changes
                          initialValue: receipt.receiptNumber,
                          decoration: const InputDecoration(labelText: "N° Recibo (Auto)", filled: true),
                          readOnly: true,
                          enabled: false, 
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Payer Selection (V2 Updated)
                  Row(
                    children: [
                      // List Filter Dropdown
                       BlocBuilder<PeopleListCubit, PeopleListState>(
                         builder: (context, peopleState) {
                           List<String> lists = [];
                           if (peopleState is PeopleListLoaded) {
                             lists = peopleState.listNames;
                           }
                           
                           return DropdownButton<String>(
                             hint: const Text("Filtrar por Lista"),
                             value: _selectedListFilter,
                             items: [
                               const DropdownMenuItem(value: null, child: Text("Todas las listas")),
                               ...lists.map((l) => DropdownMenuItem(value: l, child: Text(l)))
                             ],
                             onChanged: (val) => setState(() => _selectedListFilter = val),
                           );
                         }
                       ),
                       const SizedBox(width: 16),
                       const Expanded(child: Text("Seleccione persona para autocompletar:", style: TextStyle(color: Colors.grey, fontSize: 12))),
                    ]
                  ),
                  const SizedBox(height: 8),
                  
                   BlocBuilder<PeopleListCubit, PeopleListState>(
                    builder: (context, peopleState) {
                      List<Person> options = [];
                      if (peopleState is PeopleListLoaded) {
                        options = peopleState.allPeople;
                        // Apply Filter
                        if (_selectedListFilter != null) {
                          options = options.where((p) => p.listName == _selectedListFilter).toList();
                        }
                      }

                      return LayoutBuilder(
                        builder: (context, constraints) {
                          return Row(
                            children: [
                              Expanded(
                                child: Autocomplete<Person>(
                                  textEditingController: _nameCtrl, // Added
                                  focusNode: _nameFocus, // Fix: Must provide focusNode if providing controller
                                  optionsBuilder: (TextEditingValue textEditingValue) {
                                    if (textEditingValue.text == '') {
                                      return const Iterable<Person>.empty();
                                    }
                                    return options.where((Person option) {
                                      return option.name.toLowerCase().contains(textEditingValue.text.toLowerCase()) || 
                                             (option.identifier != null && option.identifier!.contains(textEditingValue.text));
                                    });
                                  },
                                  displayStringForOption: (Person option) => option.name,
                                  onSelected: (Person selection) {
                                    context.read<ReceiptFormCubit>().updatePayerName(selection.name);
                                    if (selection.identifier != null) {
                                       context.read<ReceiptFormCubit>().updatePayerIdentifier(selection.identifier!);
                                       if (!_dniFocus.hasFocus) { // Only update UI if not focused to avoid erratic behavior, but we just selected so it's fine
                                          _dniCtrl.text = selection.identifier!;
                                       }
                                    }
                                  },
                                  fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                                    // Sync if needed (we want to keep manual input capability)
                                    // But Autocomplete usually manages its own controller.
                                    // If we want to sync with Cubit state on init:
                                    if (controller.text.isEmpty && receipt.payerName != null) {
                                      controller.text = receipt.payerName!;
                                    }
                                    
                                    return TextFormField(
                                      controller: controller,
                                      focusNode: focusNode,
                                      onFieldSubmitted: (val) => onFieldSubmitted(),
                                      decoration: const InputDecoration(
                                        labelText: "Recibido de (Nombre)",
                                        hintText: "Escriba nombre o DNI..."
                                      ),
                                      onChanged: (val) {
                                        // Update cubit as they type so manual entry works
                                        context.read<ReceiptFormCubit>().updatePayerName(val);
                                      },
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              PopupMenuButton<Person>(
                                icon: const Icon(Icons.arrow_drop_down_circle, color: Colors.blue),
                                tooltip: "Seleccionar de la lista",
                                onSelected: (Person selection) {
                                   context.read<ReceiptFormCubit>().updatePayerName(selection.name);
                                   if (selection.identifier != null) {
                                      context.read<ReceiptFormCubit>().updatePayerIdentifier(selection.identifier!);
                                      _dniCtrl.text = selection.identifier!;
                                   }
                                },
                                itemBuilder: (context) {
                                  // If specific list selected, show plain list
                                  if (_selectedListFilter != null) {
                                    return options.map((p) => PopupMenuItem(
                                      value: p,
                                      child: Text(p.name),
                                    )).toList();
                                  } else {
                                    // Safety check
                                    if (peopleState is! PeopleListLoaded) return [];

                                    // If ALL selected, show grouped
                                    // We can't do headers easily in PopupMenuButton items without workaround
                                    // Workaround: Use enabled:false items as headers
                                    List<PopupMenuEntry<Person>> items = [];
                                    
                                    // We need the grouped data from Cubit state
                                    final grouped = (peopleState as PeopleListLoaded).grouped; 
                                    
                                    for (var listName in grouped.keys) {
                                      items.add(PopupMenuItem(
                                        enabled: false, 
                                        child: Text(listName, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))
                                      ));
                                      for (var p in grouped[listName]!) {
                                        items.add(PopupMenuItem(
                                          value: p, 
                                          child: Padding(padding: const EdgeInsets.only(left: 16), child: Text(p.name))
                                        ));
                                      }
                                    }
                                    return items;
                                  }
                                },
                              )
                            ],
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  
                  // DNI Field (V2.1 Autocomplete)
                  BlocBuilder<PeopleListCubit, PeopleListState>(
                    builder: (context, peopleState) {
                      List<Person> options = [];
                      if (peopleState is PeopleListLoaded) {
                        options = peopleState.allPeople;
                        // Apply Filter
                        if (_selectedListFilter != null) {
                          options = options.where((p) => p.listName == _selectedListFilter).toList();
                        }
                      }
                      
                      return Autocomplete<Person>(
                        textEditingController: _dniCtrl,
                        focusNode: _dniFocus,
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text == '') {
                            return const Iterable<Person>.empty();
                          }
                          return options.where((Person option) {
                             return option.identifier != null && option.identifier!.contains(textEditingValue.text);
                          });
                        },
                        displayStringForOption: (Person option) => option.identifier ?? "",
                        onSelected: (Person selection) {
                          // Update Cubit
                          context.read<ReceiptFormCubit>().updatePayerIdentifier(selection.identifier ?? "");
                          context.read<ReceiptFormCubit>().updatePayerName(selection.name);
                          
                          // Update UI Controllers
                          if (_nameCtrl.text != selection.name) {
                             _nameCtrl.text = selection.name;
                          }
                        },
                        fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                           return TextFormField(
                             controller: controller,
                             focusNode: focusNode,
                             decoration: const InputDecoration(labelText: "DNI / Identificador / RUC", hintText: "Escriba DNI para buscar..."),
                             onFieldSubmitted: (val) {
                               context.read<ReceiptFormCubit>().updatePayerIdentifier(val);
                               onFieldSubmitted();
                             },
                             onChanged: (val) {
                                context.read<ReceiptFormCubit>().updatePayerIdentifier(val);
                             },
                             textInputAction: TextInputAction.done,
                           );
                        },
                      );
                    }
                  ),
                  const SizedBox(height: 24),

                  // Items Section
                  const Text("Items / Conceptos", style: TextStyle(fontWeight: FontWeight.bold)),
                  const Divider(),
                  
                  // Add Item Row
                  Row(
                    children: [
                       Expanded(
                         flex: 3,
                         child: TextField(
                           controller: _descCtrl,
                           decoration: const InputDecoration(labelText: "Descripción", isDense: true),
                         ),
                       ),
                       const SizedBox(width: 8),
                       Expanded(
                         flex: 1,
                         child: TextField(
                           controller: _amountCtrl,
                           decoration: const InputDecoration(labelText: "Cant.", isDense: true),
                           keyboardType: TextInputType.number,
                         ),
                       ),
                       const SizedBox(width: 8),
                        Expanded(
                         flex: 1,
                         child: TextField(
                           controller: _priceCtrl,
                           decoration: const InputDecoration(labelText: "Precio", isDense: true),
                           keyboardType: TextInputType.number,
                         ),
                       ),
                       IconButton(
                         icon: const Icon(Icons.add_circle, color: Colors.green),
                         onPressed: () {
                           if (_descCtrl.text.isNotEmpty) {
                             final q = double.tryParse(_amountCtrl.text) ?? 1;
                             final p = double.tryParse(_priceCtrl.text) ?? 0;
                             final item = ReceiptItem()
                               ..description = _descCtrl.text
                               ..quantity = q
                               ..unitPrice = p;
                             
                             context.read<ReceiptFormCubit>().addItem(item);
                             
                             _descCtrl.clear();
                             _amountCtrl.clear();
                             _priceCtrl.clear();
                           }
                         },
                       )
                    ],
                  ),
                  const SizedBox(height: 8),
                  
                  // Items List
                  if (receipt.items != null)
                  ...receipt.items!.asMap().entries.map((entry) {
                    final idx = entry.key;
                    final item = entry.value;
                    return Card(
                      child: ListTile(
                        dense: true,
                        title: Text(item.description ?? ""),
                        subtitle: Text("${item.quantity} x ${item.unitPrice} = ${item.total.toStringAsFixed(2)}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => context.read<ReceiptFormCubit>().removeItem(idx),
                        ),
                      ),
                    );
                  }),
                  
                  const SizedBox(height: 20),
                  const Divider(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text("TOTAL: ${receipt.totalAmount?.toStringAsFixed(2) ?? "0.00"}", 
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  ),
                ],
              );
            },
          ),
          ),
        ),
      ],
    );
  }
}
