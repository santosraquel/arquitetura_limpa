import 'dart:math';

// https://api.dart.dev/stable/2.18.2/dart-math/Random-class.html

// com 11 digitos

// anoAtual + codigo do curso + numero aleatorio de x digitos
// 2019 + 000 + 0000
class GeradorRa {
  int anoAtual;
  int codigoDisciplina;
  int numeroAleatorio;

  GeradorRa(
      {required this.anoAtual,
      required this.codigoDisciplina,
      required this.numeroAleatorio});

  // obtendo o ano atual
  String obterAnoAtual() {
    var dataAtual = new DateTime.now();
    var anoAtual = dataAtual.year.toString();
    return anoAtual;
  }

  String gerarCodigoAleatorio() {
    Random random = new Random();
    String numeroAleatorio = (random.nextInt(99999) + 9999).toString();
    return numeroAleatorio;
  }

  int gerarRa() {
    String codigoDisciplina = '000';
    var anoAtual = obterAnoAtual();
    var codigoAleatorio = gerarCodigoAleatorio();
    var montandoRa = anoAtual + codigoDisciplina + codigoAleatorio;
    var ra = int.parse(montandoRa);
    return ra;
  }
}
