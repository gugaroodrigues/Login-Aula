import 'package:flutter/material.dart';

import '../widgets/forms_widget.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        backgroundColor: const Color(0xFF1C1B2D),
        foregroundColor: Colors.white, // Define a cor do ícone de voltar e do título
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1C1B2D),
              Color(0xFF0C0B15),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Crie sua Conta',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                BuildTextField(
                  hint: 'Nome Completo',
                  icon: Icons.person_outline,
                  obscureText: false,
                ),
                const SizedBox(height: 16),
                BuildTextField(
                  hint: 'Email',
                  icon: Icons.email_outlined,
                  obscureText: false,
                ),
                const SizedBox(height: 16),
                BuildTextField(
                  hint: 'Senha',
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                BuildTextField(
                  hint: 'Confirmar Senha',
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Lógica para registrar o usuário
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Botão de cadastro clicado!')),
                      );
                      // Você pode adicionar a lógica de navegação de volta ou para a tela principal aqui
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E62F3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Registrar',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

