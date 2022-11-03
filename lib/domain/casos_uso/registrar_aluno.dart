import 'package:arquitetura_limpa/domain/caso_uso/notificar_aluno.dart';
import 'package:arquitetura_limpa/domain/dados/dados_aluno.dart';
import 'package:arquitetura_limpa/domain/entidade/aluno.dart';
import 'package:arquitetura_limpa/domain/portas/aluno_respositorio.dart';
import 'package:arquitetura_limpa/domain/portas/enviar_email.dart';

class RegistrarAluno {
  DadosAluno dadosAluno;
  late Aluno aluno;
  late AlunoRepositorio repositorio;
  late EnviarEmail email;

  RegistrarAluno(this.dadosAluno) {
    aluno = Aluno.criar(dadosAluno);
    var notificar = NotificarAluno(dadosAluno);
    if (repositorio.salvar(dadosAluno)) notificar.enviarEmail();
  }
}
