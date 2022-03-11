import 'dart:convert';

class ComandaModel {
  final num? id;
  final String? nomeBar;
  final double? total;
  // fotoComanda;
  // List<ProdutosModel> produtos;
  // List<ClientesModel> clientes;

  ComandaModel(this.nomeBar, {this.id, this.total = 0});

  @override
  String toString() =>
      'ComandaModel(id: $id, nomeBar: $nomeBar, total: $total)';

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nomeBar': nomeBar,
      'total': total,
    };
  }

  ComandaModel.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        nomeBar = map['nomeBar'],
        total = map['total'];

  String toJson() => json.encode(toMap());

  factory ComandaModel.fromJson(String source) =>
      ComandaModel.fromMap(json.decode(source));
}
