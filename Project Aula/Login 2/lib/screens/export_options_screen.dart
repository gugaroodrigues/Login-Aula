// lib/screens/export_options_screen.dart
import 'package:flutter/material.dart';
import 'package:login_2/widgets/gradient_background.dart'; // Importe seu GradientBackground

class ExportOptionsScreen extends StatelessWidget {
  const ExportOptionsScreen({super.key});

  // Métodos de exportação (apenas placeholders por enquanto)
  void _exportToPdf(BuildContext context) {
    // Lógica para exportar para PDF
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Exportando para PDF... (Funcionalidade a ser implementada)')),
    );
    // Navigator.pop(context); // Opcional: Voltar após iniciar a exportação
  }

  void _exportToExcel(BuildContext context) {
    // Lógica para exportar para Excel
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Exportando para Excel... (Funcionalidade a ser implementada)')),
    );
    // Navigator.pop(context); // Opcional: Voltar após iniciar a exportação
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exportar Dados'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: GradientBackground(
        title: 'exportar',
        // O padding do GradientBackground já deve cuidar do espaçamento horizontal
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + kToolbarHeight + 20), // Espaçamento abaixo da AppBar
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Estica os botões horizontalmente
            children: [
              const Text(
                'Escolha o formato de exportação:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () => _exportToPdf(context),
                icon: const Icon(Icons.picture_as_pdf, color: Colors.white),
                label: const Text('Exportar para PDF'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[700], // Cor para PDF
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => _exportToExcel(context),
                icon: const Icon(Icons.table_chart, color: Colors.white),
                label: const Text('Exportar para Excel'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700], // Cor para Excel
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
