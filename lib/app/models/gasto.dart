class Gasto {
  int? id;
  String nome;
  String? valor;
  DateTime? data;

  Gasto({
    this.id,
    required this.nome,
    this.valor,
    this.data,
  });
}

class Categoria {
  List<Gasto> gasto;
  String nome;

  Categoria({
    required this.gasto,
    required this.nome,
  });
}
