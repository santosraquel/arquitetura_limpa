import 'package:arquitetura_limpa/domain/dados/dados_aluno.dart';
import 'package:arquitetura_limpa/domain/entidade/aluno.dart';
import 'package:arquitetura_limpa/domain/entidade/disciplina.dart';

abstract class NotaRepositorio {
  identificarAluno(DadosAluno dadosAluno);
  bool salvar(Aluno aluno, Disciplina nota);
}
