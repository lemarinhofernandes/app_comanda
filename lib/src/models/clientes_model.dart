import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app_comanda/src/models/produtos_model.dart';

class ClientesModel {
  final num? id;
  final String? nome;
  final double? valorGasto;
  final List<ProdutosModel>? produtosConsumidos;

  ClientesModel({
    this.id,
    this.nome,
    this.valorGasto,
    this.produtosConsumidos,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'valorGasto': valorGasto,
      'produtosConsumidos':
          produtosConsumidos?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory ClientesModel.fromMap(Map<String, dynamic> map) {
    return ClientesModel(
      id: map['id'],
      nome: map['nome'],
      valorGasto: map['valorGasto']?.toDouble(),
      produtosConsumidos: map['produtosConsumidos'] != null
          ? List<ProdutosModel>.from(
              map['produtosConsumidos']?.map((x) => ProdutosModel.fromMap(x)))
          : null,
    );
  }

  @override
  String toString() {
    return 'ClientesModel(id: $id, nome: $nome, valorGasto: $valorGasto, produtosConsumidos: $produtosConsumidos)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ClientesModel &&
        other.id == id &&
        other.nome == nome &&
        other.valorGasto == valorGasto &&
        listEquals(other.produtosConsumidos, produtosConsumidos);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nome.hashCode ^
        valorGasto.hashCode ^
        produtosConsumidos.hashCode;
  }
}
