import 'package:flutter/material.dart';
import '../widgets/screen_background.dart';
import '../models/categoria.dart';

class CategoriasScreen extends StatefulWidget {
  final List<Categoria> categorias;
  final Function(Categoria) onAdicionarCategoria;

  const CategoriasScreen({
    super.key,
    required this.categorias,
    required this.onAdicionarCategoria,
  });

  @override
  State<CategoriasScreen> createState() => _CategoriasScreenState();
}

class _CategoriasScreenState extends State<CategoriasScreen> {
  void _mostrarDialogAdicionarCategoria() {
    final nomeController = TextEditingController();
    IconData iconeSelecionado = Icons.category;
    Color corSelecionada = Colors.blue;

    final List<IconData> icones = [
      Icons.category,
      Icons.shopping_cart,
      Icons.home,
      Icons.movie,
      Icons.local_hospital,
      Icons.directions_car,
      Icons.school,
      Icons.restaurant,
      Icons.fitness_center,
      Icons.work,
      Icons.phone,
      Icons.pets,
    ];

    final List<Color> cores = [
      Colors.blue,
      Colors.green,
      Colors.red,
      Colors.purple,
      Colors.orange,
      Colors.indigo,
      Colors.teal,
      Colors.pink,
      Colors.amber,
      Colors.cyan,
      Colors.lime,
      Colors.brown,
    ];

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          backgroundColor: const Color(0xFF1E3A8A),
          title: const Text(
            'Nova Categoria',
            style: TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nome da categoria
                const Text(
                  'Nome',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: nomeController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Digite o nome da categoria',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Ícone
                const Text(
                  'Ícone',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: icones.length,
                    itemBuilder: (context, index) {
                      final icone = icones[index];
                      final isSelected = icone == iconeSelecionado;
                      return GestureDetector(
                        onTap: () {
                          setDialogState(() {
                            iconeSelecionado = icone;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.blue.withOpacity(0.3)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isSelected
                                  ? Colors.blue
                                  : Colors.white.withOpacity(0.2),
                            ),
                          ),
                          child: Icon(
                            icone,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                // Cor
                const Text(
                  'Cor',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: cores.length,
                    itemBuilder: (context, index) {
                      final cor = cores[index];
                      final isSelected = cor == corSelecionada;
                      return GestureDetector(
                        onTap: () {
                          setDialogState(() {
                            corSelecionada = cor;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: cor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? Colors.white : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Colors.white70),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (nomeController.text.isNotEmpty) {
                  final novaCategoria = Categoria(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    nome: nomeController.text,
                    icone: iconeSelecionado,
                    cor: corSelecionada,
                  );
                  widget.onAdicionarCategoria(novaCategoria);
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600],
                foregroundColor: Colors.white,
              ),
              child: const Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      title: 'Categorias',
      child: Column(
        children: [
          const SizedBox(height: 20),
          // Botão Adicionar Categoria
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _mostrarDialogAdicionarCategoria,
              icon: const Icon(Icons.add),
              label: const Text('Adicionar Categoria'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Lista de Categorias
          Expanded(
            child: ListView.builder(
              itemCount: widget.categorias.length,
              itemBuilder: (context, index) {
                final categoria = widget.categorias[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: categoria.cor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          categoria.icone,
                          color: categoria.cor,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          categoria.nome,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

