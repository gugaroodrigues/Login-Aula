import 'package:flutter/material.dart';
import '../widgets/screen_background.dart';
import '../models/transacao.dart';
import '../models/categoria.dart';

class AdicionarTransacaoScreen extends StatefulWidget {
  final List<Categoria> categorias;
  final Function(Transacao) onAdicionarTransacao;

  const AdicionarTransacaoScreen({
    super.key,
    required this.categorias,
    required this.onAdicionarTransacao,
  });

  @override
  State<AdicionarTransacaoScreen> createState() =>
      _AdicionarTransacaoScreenState();
}

class _AdicionarTransacaoScreenState extends State<AdicionarTransacaoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descricaoController = TextEditingController();
  final _valorController = TextEditingController();
  
  TipoTransacao _tipoSelecionado = TipoTransacao.despesa;
  Categoria? _categoriaSelecionada;

  @override
  void initState() {
    super.initState();
    if (widget.categorias.isNotEmpty) {
      _categoriaSelecionada = widget.categorias.first;
    }
  }

  void _salvarTransacao() {
    if (_formKey.currentState!.validate() && _categoriaSelecionada != null) {
      final transacao = Transacao(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        descricao: _descricaoController.text,
        valor: double.parse(_valorController.text.replaceAll(',', '.')),
        tipo: _tipoSelecionado,
        categoria: _categoriaSelecionada!,
        data: DateTime.now(),
      );

      widget.onAdicionarTransacao(transacao);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      title: 'Adicionar Transação',
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Tipo de Transação
            const Text(
              'Tipo de Transação',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: Column(
                children: [
                  RadioListTile<TipoTransacao>(
                    title: const Text(
                      'Entrada',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: TipoTransacao.entrada,
                    groupValue: _tipoSelecionado,
                    onChanged: (value) {
                      setState(() {
                        _tipoSelecionado = value!;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                  RadioListTile<TipoTransacao>(
                    title: const Text(
                      'Saída',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: TipoTransacao.saida,
                    groupValue: _tipoSelecionado,
                    onChanged: (value) {
                      setState(() {
                        _tipoSelecionado = value!;
                      });
                    },
                    activeColor: Colors.orange,
                  ),
                  RadioListTile<TipoTransacao>(
                    title: const Text(
                      'Despesa',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: TipoTransacao.despesa,
                    groupValue: _tipoSelecionado,
                    onChanged: (value) {
                      setState(() {
                        _tipoSelecionado = value!;
                      });
                    },
                    activeColor: Colors.red,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Descrição
            const Text(
              'Descrição',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _descricaoController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Digite a descrição',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, digite uma descrição';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            // Valor
            const Text(
              'Valor',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _valorController,
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '0,00',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                prefixText: 'R\$ ',
                prefixStyle: const TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, digite um valor';
                }
                if (double.tryParse(value.replaceAll(',', '.')) == null) {
                  return 'Por favor, digite um valor válido';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            // Categoria
            const Text(
              'Categoria',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Categoria>(
                  value: _categoriaSelecionada,
                  dropdownColor: const Color(0xFF1E3A8A),
                  style: const TextStyle(color: Colors.white),
                  items: widget.categorias.map((categoria) {
                    return DropdownMenuItem<Categoria>(
                      value: categoria,
                      child: Row(
                        children: [
                          Icon(categoria.icone, color: categoria.cor, size: 20),
                          const SizedBox(width: 12),
                          Text(categoria.nome),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (categoria) {
                    setState(() {
                      _categoriaSelecionada = categoria;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Botão Salvar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _salvarTransacao,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Salvar',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _descricaoController.dispose();
    _valorController.dispose();
    super.dispose();
  }
}

