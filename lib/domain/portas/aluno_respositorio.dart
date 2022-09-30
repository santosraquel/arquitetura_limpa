import 'package:arquitetura_limpa/domain/dados/dados_aluno.dart';

abstract class AlunoRepositorio {
  bool salvar(DadosAluno dadosAluno);
  bool existe(DadosAluno dadosAluno);
  excluir(int id);
  listar();
  buscar(int id);
}
