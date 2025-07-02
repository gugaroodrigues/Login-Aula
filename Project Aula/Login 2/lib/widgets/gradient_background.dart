// lib/widgets/gradient_background.dart
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child; // O conteúdo que será exibido dentro deste background
  final EdgeInsetsGeometry padding; // Permite personalizar o padding

  const GradientBackground({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 32), required String title,
    // Removido 'required String title,' pois não é usado aqui e causaria erro
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: padding, // Aplica o padding
      child: child, // Renderiza o conteúdo passado como child
    );
  }
}
