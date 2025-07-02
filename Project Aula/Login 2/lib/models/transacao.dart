import 'categoria.dart';

enum TipoTransacao { entrada, saida, despesa }

class Transacao {
  final String id;
  final String descricao;
  final double valor;
  final TipoTransacao tipo;
  final Categoria categoria;
  final DateTime data;

  Transacao({
    required this.id,
    required this.descricao,
    required this.valor,
    required this.tipo,
    required this.categoria,
    required this.data,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descricao': descricao,
      'valor': valor,
      'tipo': tipo.index,
      'categoria': categoria.toJson(),
      'data': data.millisecondsSinceEpoch,
    };
  }

  factory Transacao.fromJson(Map<String, dynamic> json) {
    return Transacao(
      id: json['id'],
      descricao: json['descricao'],
      valor: json['valor'].toDouble(),
      tipo: TipoTransacao.values[json['tipo']],
      categoria: Categoria.fromJson(json['categoria']),
      data: DateTime.fromMillisecondsSinceEpoch(json['data']),
    );
  }
}

