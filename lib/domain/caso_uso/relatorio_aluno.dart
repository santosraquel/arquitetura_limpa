import 'package:arquitetura_limpa/domain/dados/dados_aluno.dart';
import 'package:arquitetura_limpa/domain/entidade/aluno.dart';
import 'package:arquitetura_limpa/domain/entidade/disciplina.dart';
import 'package:arquitetura_limpa/domain/erro/aluno_inexistente.dart';
import 'package:arquitetura_limpa/domain/portas/aluno_respositorio.dart';
import 'package:arquitetura_limpa/domain/portas/relatorio_aluno_respositorio.dart';

class RelatorioAluno {
  AlunoRepositorio repositorioAluno;
  RepositorioRelatorioAluno repositorioRelatorioAluno;
  DadosAluno dadosAluno;
  late Aluno aluno;
  late Disciplina nota1;
  late Disciplina nota2;
  late Disciplina nota3;
  late Disciplina media;

  RelatorioAluno(
      this.repositorioAluno, this.dadosAluno, this.repositorioRelatorioAluno) {
    // verificando se o aluno já existe
    if (!repositorioAluno.existe(dadosAluno)) throw AlunoInexistente();
    Aluno aluno = Aluno.criar(dadosAluno); // criando aluno
    repositorioRelatorioAluno
        .identificarAluno(dadosAluno); // identificando o aluno
    double media = media.calcularMedia(nota1, nota2, nota3);
  }

  notificarAluno() {
    print(aluno.email);
  }
}


// mostrar:
    // - o R.A do aluno
    // - o nome do aluno
    // a média
    // status por média (APROVADO / REPROVADO)
    // percentual de presença
    // status por presença (APROVADO / REPROVADO)
