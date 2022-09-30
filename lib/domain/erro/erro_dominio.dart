class ErroDominio implements Exception {
  String mensagem;

  ErroDominio(this.mensagem);

  @override
  String toString() {
    return mensagem;
  }
}
