import 'package:arquitetura_limpa/domain/dados/dados_aluno.dart';

abstract class RepositorioRelatorioAluno {
  identificarAluno(DadosAluno dadosAluno);
  bool salvar();
}
