import 'package:arquitetura_limpa/domain/dados/dados_aluno.dart';
import 'package:arquitetura_limpa/domain/entidade/disciplina.dart';

abstract class NotaRepositorio {
  identificarAluno(DadosAluno dadosAluno);
  bool salvar(Disciplina nota1, Disciplina nota2, Disciplina nota3);
}
