import 'dart:convert';

enum TipoEnum { ALCOOLICO, NAOALCOOLICO, COMIDA, OUTRO }

class ProdutosModel {
  final String? nome;
  final double? preco;
  final TipoEnum? tipo;
  // foto
  ProdutosModel({
    this.nome,
    this.preco,
    this.tipo,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'preco': preco,
      'tipo': tipo,
    };
  }

  ProdutosModel.fromMap(Map<String, dynamic> map)
      : nome = map['nome'],
        preco = map['preco'],
        tipo = TipoEnum.values[map['tipo']];

  String toJson() => json.encode(toMap());

  factory ProdutosModel.fromJson(String source) =>
      ProdutosModel.fromMap(json.decode(source));

  @override
  String toString() => 'ProdutosModel(nome: $nome, preco: $preco, tipo: $tipo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProdutosModel &&
        other.nome == nome &&
        other.preco == preco &&
        other.tipo == tipo;
  }

  @override
  int get hashCode => nome.hashCode ^ preco.hashCode ^ tipo.hashCode;
}
