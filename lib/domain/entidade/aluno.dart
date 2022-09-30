import 'package:arquitetura_limpa/domain/dados/dados_aluno.dart';
import 'package:arquitetura_limpa/domain/erro/email_invalido.dart';
import 'package:arquitetura_limpa/domain/erro/ra_invalido.dart';

class Aluno {
  late String nome;
  late String ra;
  late String email;

  Aluno({required this.nome, required this.ra, required this.email});

  Aluno.criar(DadosAluno dadosAluno) {
    var nome = dadosAluno.nome;
    var ra = dadosAluno.ra;
    var email = dadosAluno.email;
    if (email.isEmpty || !email.contains('@')) throw EmailInvalido();

    // ignore: todo
    // TODO
    // R.A não pode ter mais que 11 digitos
    if (ra.isEmpty || ra.length < 11) throw RaInvalido();
    this.nome = nome;
    this.ra = ra;
    this.email = email;
  }
}
