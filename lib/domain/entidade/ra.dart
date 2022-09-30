class Ra {
  String ra;
  final String mensagemRaInvalido = 'R.A inválido';

  Ra(this.ra) {
    //if(!validarRA()) throw Exception('R.A inválido');
  }

  bool validarRA() {
    return validarComprimento();
  }

  String somenteNumero() {
    var somenteNumero = ra.replaceAll(RegExp(r'[\.\-\D]'), '');
    return somenteNumero;
  }

  bool validarComprimento() {
    return somenteNumero().toString().length == 11;
  }
}
