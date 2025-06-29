// lib/widgets/forms_widget.dart (ou lib/forms_widget.dart)
import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  final TextEditingController? controller; // Pode ser nulo se não for necessário um controller
  final String hint;
  final IconData icon;
  final bool obscureText;
  final String? Function (String?)? validator;
  final TextInputType? keyboardType;


  const BuildTextField({
    super.key,
    this.controller, // Torna o controller opcional
    required this.hint,
    required this.icon,
    this.obscureText = false, // Define um valor padrão para obscureText
    this.validator,
    this.keyboardType
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white),
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white70),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white38),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }
}
