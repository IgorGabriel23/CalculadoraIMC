
import 'package:flutter/material.dart';
import '../controllers/imc_controller.dart';

class IMCView extends StatefulWidget {
  const IMCView({super.key});

  @override
  State<IMCView> createState() => _IMCViewState();
}

class _IMCViewState extends State<IMCView> {
  final _formKey = GlobalKey<FormState>();
  final _pesoController = TextEditingController();
  final _alturaController = TextEditingController();
  final _controller = IMCController();
  String _resultado = '';

  void _calcular() {
    if (_formKey.currentState!.validate()) {
      final peso = double.parse(_pesoController.text);
      final altura = double.parse(_alturaController.text);
      final resultado = _controller.calcularIMC(peso, altura);
      setState(() => _resultado = resultado);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de IMC')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _pesoController,
                decoration: const InputDecoration(labelText: 'Peso (kg)'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value == null || double.tryParse(value) == null ? 'Digite um número válido' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _alturaController,
                decoration: const InputDecoration(labelText: 'Altura (m)'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value == null || double.tryParse(value) == null ? 'Digite um número válido' : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: _calcular, child: const Text('Calcular IMC')),
              const SizedBox(height: 16),
              Text(_resultado, style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
