import 'package:flutter/material.dart';
import 'package:mobile/features/auth/presentation/components/button.dart';
import 'package:mobile/features/auth/presentation/components/phone_input.dart';
import 'package:mobile/features/auth/presentation/components/password_input.dart';
import 'package:mobile/features/components/custom_alert_dialog.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Ajouter pour simuler un call API
      await Future.delayed(const Duration(seconds: 2));

      // Valeur statique pour la demontration
      final bool loginSuccess =
          phoneController.text.replaceAll(' ', '') == "0000000000" &&
          passwordController.text == "password";

      if (loginSuccess) {
        if (mounted) {
          context.go("/home");
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Login successful!')));
        }
      } else {
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => CustomAlertDialog(
              title: 'Numéro de téléphone ou mot de passe incorrect',
              content: 'Identifiants invalides.',
              onPrimaryPressed: () {
                Navigator.pop(context);
              },
            ),
          );
        }
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              PhoneInput(
                label: "Numéro de téléphone",
                enabled: !_isLoading,
                controller: phoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrez votre numéro svp';
                  }
                  final digitsOnly = value.replaceAll(' ', '');
                  if (digitsOnly.length != 10) {
                    return 'Le numéro doit contenir 10 chiffres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              PasswordInput(
                label: "Mot de passe",
                hintText: "Entrez votre mot de passe",
                enabled: !_isLoading,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrez votre mot de passe svp';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50),
              Button(
                isLoading: _isLoading,
                text: "Se connecter",
                onPressed: _onSubmit,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
