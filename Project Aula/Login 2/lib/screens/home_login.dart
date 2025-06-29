import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_2/screens/registration_page.dart';
import 'package:login_2/widgets/forms_widget.dart';
import 'package:login_2/widgets/gradient_background.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  void _fazerLogin() {
    final email = _emailController.text;
    final senha = _senhaController.text;

    if (email == "teste@teste.com" && senha == "1234") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login bem-sucedido!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email ou senha inválidos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground( // Usando o novo widget aqui
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Entre',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Email',
                  style: TextStyle(color: Color(0xFFA1A1B5)),
                ),
                const SizedBox(height: 8),
                BuildTextField(
                  controller: _emailController,
                  hint: 'aimalnaseem@gmail.com',
                  icon: Icons.email_outlined,
                  obscureText: false,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Senha',
                  style: TextStyle(color: Color(0xFFA1A1B5)),
                ),
                const SizedBox(height: 8),
                BuildTextField(
                  controller: _senhaController,
                  hint: '********',
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _fazerLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E62F3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Entre',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Novo Usuário? ',
                      style: const TextStyle(color: Colors.white70),
                      children: [
                        TextSpan(
                          text: 'Registre se',
                          style: const TextStyle(
                            color: Color(0xFF1E62F3),
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navega para a tela de cadastro
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegistrationPage(),
                                ),
                              );
                            },
                        )
                      ],
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
