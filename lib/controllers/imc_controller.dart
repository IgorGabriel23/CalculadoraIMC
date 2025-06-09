
class IMCController {
  String calcularIMC(double peso, double altura) {
    if (altura <= 0) return 'Altura inválida';
    final imc = peso / (altura * altura);
    if (imc < 18.5) return 'Abaixo do peso';
    if (imc < 24.9) return 'Peso normal';
    if (imc < 29.9) return 'Sobrepeso';
    if (imc < 34.9) return 'Obesidade grau 1';
    if (imc < 39.9) return 'Obesidade grau 2';
    return 'Obesidade grau 3';
  }
}
