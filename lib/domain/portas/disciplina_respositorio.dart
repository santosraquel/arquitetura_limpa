import 'package:arquitetura_limpa/domain/dados/dados_aluno.dart';

abstract class DisciplinaRepositorio {
  bool salvar(
      DadosAluno dadosAluno,
      String nomeDisciplina,
      double nota1,
      double nota2,
      double nota3,
      int quantidadePresenca,
      int cargaHorariaDisciplina);
}
