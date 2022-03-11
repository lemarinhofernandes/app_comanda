import 'dart:convert';

class ComandaModel {
  final String? nomeBar;
  final double? total;
  // fotoComanda;
  // List<ProdutosModel> produtos;
  // List<ClientesModel> clientes;

  ComandaModel(this.nomeBar, {this.total = 0});

  @override
  String toString() => 'ComandaModel(nomeBar: $nomeBar, total: $total)';

  Map<String, dynamic> toMap() {
    return {
      'nomeBar': nomeBar,
      'total': total,
    };
  }

  ComandaModel.fromMap(Map<String, dynamic> map)
      : nomeBar = map['nomeBar'],
        total = map['total'];

  String toJson() => json.encode(toMap());

  factory ComandaModel.fromJson(String source) =>
      ComandaModel.fromMap(json.decode(source));
}
