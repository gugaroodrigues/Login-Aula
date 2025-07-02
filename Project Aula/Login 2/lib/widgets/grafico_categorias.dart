import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/transacao.dart';
import '../models/categoria.dart';

class GraficoCategorias extends StatelessWidget {
  final List<Transacao> transacoes;

  const GraficoCategorias({
    super.key,
    required this.transacoes,
  });

  Map<String, double> get dadosPorCategoria {
    final Map<String, double> dados = {};

    for (var transacao in transacoes) {
      if (transacao.tipo != TipoTransacao.entrada) {
        final nomeCategoria = transacao.categoria.nome;
        dados[nomeCategoria] = (dados[nomeCategoria] ?? 0) + transacao.valor;
      }
    }

    return dados;
  }

  List<PieChartSectionData> get secoes {
    final dados = dadosPorCategoria;
    final total = dados.values.fold(0.0, (sum, value) => sum + value);

    if (total == 0) {
      return [
        PieChartSectionData(
          color: Colors.grey.withOpacity(0.1),
          value: 100,
          title: 'Sem dados',
          radius: 80,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
      ];
    }

    final cores = [
      Color(0xFF2A261D),
      Color(0xFF3B5154),
      Color(0xFF500DD7),
      Color(0xFF06122D),
      Color(0xFF6B000E),
      Color(0xFF16B98E),
      Color(0xFFBE8F95),
      Color(0xFFCC2815),
      Color(0xFF3F0CE3),
    ];

    return dados.entries.map((entry) {
      final index = dados.keys.toList().indexOf(entry.key);
      final cor = cores[index % cores.length];
      final porcentagem = (entry.value / total * 100);

      return PieChartSectionData(
        color: cor,
        value: entry.value,
        title: '${porcentagem.toStringAsFixed(1)}%',
        radius: 80,
        titleStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final dados = dadosPorCategoria;

    if (dados.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.pie_chart_outline,
              size: 50,
              color: Colors.white54,
            ),
            SizedBox(height: 16),
            Text(
              'Nenhuma despesa registrada',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        // Gráfico
        Expanded(
          flex: 2,
          child: PieChart(
            PieChartData(
              sections: secoes,
              centerSpaceRadius: 15,
              sectionsSpace: 2,
              startDegreeOffset: 90,
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Legenda
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: Column(
              children: dados.entries.map((entry) {
                final index = dados.keys.toList().indexOf(entry.key);
                final cores = [
                  Colors.red,
                  Colors.blue,
                  Colors.green,
                  Colors.orange,
                  Colors.purple,
                  Colors.teal,
                  Colors.pink,
                  Colors.amber,
                  Colors.indigo,
                  Colors.cyan,
                ];
                final cor = cores[index % cores.length];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Row(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: cor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          entry.key,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        'R\$ ${entry.value.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

