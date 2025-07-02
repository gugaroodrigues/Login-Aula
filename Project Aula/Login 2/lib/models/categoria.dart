import 'package:flutter/material.dart';

class Categoria {
  final String id;
  final String nome;
  final IconData icone;
  final Color cor;

  Categoria({
    required this.id,
    required this.nome,
    required this.icone,
    required this.cor,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'icone': icone.codePoint,
      'cor': cor.value,
    };
  }

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      id: json['id'],
      nome: json['nome'],
      icone: IconData(json['icone'], fontFamily: 'MaterialIcons'),
      cor: Color(json['cor']),
    );
  }
}

// Categorias padrão
final List<Categoria> categoriasDefault = [
  Categoria(
    id: '1',
    nome: 'Mercado',
    icone: Icons.shopping_cart,
    cor: Colors.green,
  ),
  Categoria(
    id: '2',
    nome: 'Aluguel',
    icone: Icons.home,
    cor: Colors.blue,
  ),
  Categoria(
    id: '3',
    nome: 'Lazer',
    icone: Icons.movie,
    cor: Colors.purple,
  ),
  Categoria(
    id: '4',
    nome: 'Saúde',
    icone: Icons.local_hospital,
    cor: Colors.red,
  ),
  Categoria(
    id: '5',
    nome: 'Transporte',
    icone: Icons.directions_car,
    cor: Colors.orange,
  ),
  Categoria(
    id: '6',
    nome: 'Educação',
    icone: Icons.school,
    cor: Colors.indigo,
  ),
];

