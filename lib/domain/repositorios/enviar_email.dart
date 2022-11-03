import 'package:arquitetura_limpa/domain/dados/dados_email.dart';

abstract class EnviarEmail {
  bool enviar(DadosEmail email);
}
