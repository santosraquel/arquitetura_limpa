import 'package:arquitetura_limpa/domain/entidade/aluno.dart';

import '../erro/nota_invalida.dart';

class Disciplina {
  Aluno aluno;
  String nomeDisciplina;
  double nota1;
  double nota2;
  double nota3;
  int quantidadePresenca;
  int cargaHorariaDisciplina;

  Disciplina({
    required this.aluno,
    required this.nomeDisciplina,
    required this.nota1,
    required this.nota2,
    required this.nota3,
    required this.quantidadePresenca,
    required this.cargaHorariaDisciplina,
  });

  double calcularMedia(nota1, nota2, nota3) {
    validarNota(nota1);
    validarNota(nota2);
    validarNota(nota3);
    double resultado = (nota1 + nota2 + nota3) / 3;
    return resultado;
  }

  String verificarAprovacaoMedia(nota1, nota2, nota3) {
    var media = calcularMedia(nota1, nota2, nota3);
    if (media > 6.0) {
      return 'APROVADO POR MÉDIA';
    } else {
      return 'REPROVADO POR MÉDIA';
    }
  }

  void validarNota(double nota) {
    if (nota < 0.0 || nota > 100.0) {
      throw Exception('Nota inválida!');
    }
  }

  String verificarAprovacaoPresenca(
      {required int quantidadePresenca, required int cargaHorariaDisciplina}) {
    validarValorPositivo(quantidadePresenca);
    validarValorPositivo(cargaHorariaDisciplina);
    validarQuantidadePresenca(quantidadePresenca, cargaHorariaDisciplina);
    var presencaMinima = calcularPresencaMinima(cargaHorariaDisciplina);
    if (presencaMinima >= 75) {
      return 'APROVADO POR PRESENÇA!';
    } else {
      return 'REPROVADO POR PRESENÇA!';
    }
  }

  double calcularPresencaMinima(cargaHorariaDisciplina,
      [int percetualMinimoPresenca = 75]) {
    double presenciaMinima =
        cargaHorariaDisciplina / (percetualMinimoPresenca / 100);
    return presenciaMinima;
  }

  void validarValorPositivo(int valor) {
    if (valor < 0) {
      throw Exception('O valor deve ser positivo');
    }
  }

  void validarQuantidadePresenca(
      int quantidadePresenca, int cargaHorariaDisciplina) {
    if (quantidadePresenca > cargaHorariaDisciplina) {
      throw Exception(
          'A quantidade de presença deverá ser menor do que a CH da disciplina.');
    }
  }
}
