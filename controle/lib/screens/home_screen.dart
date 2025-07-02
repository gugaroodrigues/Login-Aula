import 'package:flutter/material.dart';
import '../widgets/screen_background.dart';
import '../models/transacao.dart';
import '../models/categoria.dart';
import 'adicionar_transacao_screen.dart';
import 'categorias_screen.dart';
import '../widgets/grafico_categorias.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Transacao> transacoes = [];
  List<Categoria> categorias = categoriasDefault;

  double get saldo {
    double total = 0;
    for (var transacao in transacoes) {
      if (transacao.tipo == TipoTransacao.entrada) {
        total += transacao.valor;
      } else {
        total -= transacao.valor;
      }
    }
    return total;
  }

  double get totalEntradas {
    return transacoes
        .where((t) => t.tipo == TipoTransacao.entrada)
        .fold(0, (sum, t) => sum + t.valor);
  }

  double get totalDespesas {
    return transacoes
        .where((t) => t.tipo != TipoTransacao.entrada)
        .fold(0, (sum, t) => sum + t.valor);
  }

  void _adicionarTransacao(Transacao transacao) {
    setState(() {
      transacoes.add(transacao);
    });
  }

  void _adicionarCategoria(Categoria categoria) {
    setState(() {
      categorias.add(categoria);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ScreenBackground(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Card do Saldo
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: Column(
                children: [
                  const Text(
                    'Saldo Atual',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'R\$ ${saldo.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: saldo >= 0 ? Colors.green[300] : Colors.red[300],
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Cards de Entradas e Despesas
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green.withOpacity(0.3)),
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.arrow_upward,
                          color: Colors.green,
                          size: 24,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Entradas',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'R\$ ${totalEntradas.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.red.withOpacity(0.3)),
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.arrow_downward,
                          color: Colors.red,
                          size: 24,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Despesas',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'R\$ ${totalDespesas.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Título do Gráfico
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Despesas por Categoria',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Gráfico
            Container(
              height: 300,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: GraficoCategorias(transacoes: transacoes),
            ),
            const SizedBox(height: 20),
            // Botões de Navegação
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoriasScreen(
                            categorias: categorias,
                            onAdicionarCategoria: _adicionarCategoria,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.category),
                    label: const Text('Categorias'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.2),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80), // Espaço para o FAB
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdicionarTransacaoScreen(
                categorias: categorias,
                onAdicionarTransacao: _adicionarTransacao,
              ),
            ),
          );
        },
        backgroundColor: Colors.blue[600],
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

