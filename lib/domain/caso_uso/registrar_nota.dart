import 'package:arquitetura_limpa/domain/dados/dados_aluno.dart';
import 'package:arquitetura_limpa/domain/entidade/aluno.dart';
import 'package:arquitetura_limpa/domain/entidade/disciplina.dart';
import 'package:arquitetura_limpa/domain/erro/aluno_inexistente.dart';
import 'package:arquitetura_limpa/domain/portas/aluno_respositorio.dart';
import 'package:arquitetura_limpa/domain/portas/nota_repositorio.dart';

class RegistrarNota {
  AlunoRepositorio repositorioAluno;
  NotaRepositorio repositorioNota;
  DadosAluno dadosAluno;
  late Aluno aluno;
  late Disciplina disciplina;

  RegistrarNota(this.repositorioAluno, this.repositorioNota, this.dadosAluno) {
    // verificando se o aluno já existe
    if (!repositorioAluno.existe(dadosAluno)) throw AlunoInexistente();
    Aluno aluno = Aluno.criar(dadosAluno); // criando aluno
    Disciplina disciplina = Disciplina.validarNota(disciplina.nota1);
    if (disciplina.nota1 < 6.0) {
      throw Exception('Nota abaixo da média!');
    }
    repositorioNota.identificarAluno(dadosAluno); // identificando o aluno
    // salvando a nota do aluno
    if (repositorioNota.salvar(aluno, disciplina)) notificarAluno();
  }

  notificarAluno() {
    print(aluno.email);
  }
}
