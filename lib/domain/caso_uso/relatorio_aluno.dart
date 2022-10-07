import 'package:arquitetura_limpa/domain/dados/dados_aluno.dart';
import 'package:arquitetura_limpa/domain/entidade/aluno.dart';
import 'package:arquitetura_limpa/domain/entidade/disciplina.dart';
import 'package:arquitetura_limpa/domain/erro/aluno_inexistente.dart';
import 'package:arquitetura_limpa/domain/portas/aluno_respositorio.dart';
import 'package:arquitetura_limpa/domain/portas/relatorio_aluno_respositorio.dart';

import '../entidade/disciplina.dart';

class RelatorioAluno {
  AlunoRepositorio repositorioAluno;
  RepositorioRelatorioAluno repositorioRelatorioAluno;
  DadosAluno dadosAluno;
  late Aluno aluno;
  late Disciplina disciplina;

  RelatorioAluno(this.repositorioAluno, this.dadosAluno,
      this.repositorioRelatorioAluno, this.disciplina) {
    // verificando se o aluno já existe
    if (!repositorioAluno.existe(dadosAluno)) throw AlunoInexistente();
    Aluno aluno = Aluno.criar(dadosAluno); // criando aluno

    Disciplina disciplina = new Disciplina();
    disciplina.calcularMedia(
        disciplina.nota1, disciplina.nota2, disciplina.nota3);

    disciplina.verificarAprovacaoMedia(
        disciplina.nota1, disciplina.nota2, disciplina.nota3);

    disciplina.verificarAprovacaoPresenca(
        quantidadePresenca: disciplina.quantidadePresenca,
        cargaHorariaDisciplina: disciplina.cargaHorariaDisciplina);

    repositorioRelatorioAluno
        .identificarAluno(dadosAluno); // identificando o aluno

    if (repositorioRelatorioAluno.salvar(aluno, disciplina)) notificarAluno();
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
