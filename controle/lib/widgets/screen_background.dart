import 'package:flutter/material.dart';

class ScreenBackground extends StatelessWidget {
  final Widget child;
  final String? title;

  const ScreenBackground({
    super.key,
    required this.child,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title != null
          ? AppBar(
              title: Text(title!),
              backgroundColor: Colors.transparent,
              elevation: 0,
              foregroundColor: Colors.white,
            )
          : null,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1E3A8A), // Azul escuro
              Color(0xFF3B82F6), // Azul médio
              Color(0xFF1E40AF), // Azul escuro novamente
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

