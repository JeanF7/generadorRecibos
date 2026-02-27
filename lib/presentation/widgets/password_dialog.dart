import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/auth_cubit/auth_cubit.dart';

class PasswordDialog extends StatefulWidget {
  final String title;
  final String message;
  final bool doubleCheck;

  const PasswordDialog({
    super.key, 
    this.title = "Autenticación Requerida", 
    this.message = "Ingrese su contraseña para continuar:",
    this.doubleCheck = false,
  });

  @override
  State<PasswordDialog> createState() => _PasswordDialogState();
}

class _PasswordDialogState extends State<PasswordDialog> {
  final _passCtrl = TextEditingController();
  final _passCtrl2 = TextEditingController(); // For double check
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.message),
          const SizedBox(height: 16),
          TextField(
            controller: _passCtrl,
            obscureText: true,
            autofocus: true,
            decoration: InputDecoration(
              labelText: "Contraseña",
              errorText: _errorText,
              border: const OutlineInputBorder()
            ),
          ),
          if (widget.doubleCheck) ...[
             const SizedBox(height: 16),
             TextField(
              controller: _passCtrl2,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Confirme Contraseña",
                border: OutlineInputBorder()
              ),
            ),
          ]
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context, false), child: const Text("Cancelar")),
        ElevatedButton(
          onPressed: () async {
            setState(() => _errorText = null);
            final input = _passCtrl.text;
            
            if (widget.doubleCheck && input != _passCtrl2.text) {
               setState(() => _errorText = "Las contraseñas no coinciden (debe escribirlas dos veces por seguridad)");
               return;
            }

            final isValid = await context.read<AuthCubit>().verifyPassword(input);
            
            if (isValid) {
              if (mounted) Navigator.pop(context, true);
            } else {
              if (mounted) setState(() => _errorText = "Contraseña incorrecta");
            }
          },
          child: const Text("Confirmar"),
        )
      ],
    );
  }
}
