void main() {
  String nome = funcao(5)??'não informado';
  print(nome.toUpperCase());
}

String? funcao(int x) {
  if (x > 10) {
    return 'Julio';
  }
}
