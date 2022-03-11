import 'package:app_comanda/src/models/comanda_model.dart';
import 'package:flutter/material.dart';

class HomeScreenController {
  final List<ComandaModel> _listaMock = <ComandaModel>[
    ComandaModel('tcholas bar', total: 50),
    ComandaModel('bar do padim', total: 200.0),
    ComandaModel('A Toca', total: 125.0),
  ];

  bool opacity = false;

  List<ComandaModel> get listaMock => _listaMock;

  void addBar(ComandaModel bar) {
    try {
      _listaMock.add(bar);
      debugPrint('ADICIONA BAR => ${bar.toString()}');
    } catch (e) {
      debugPrint('ADICIONA BAR ERROR => $e');
    }
  }

  void removeBar(ComandaModel bar) {
    try {
      _listaMock.remove(bar);
      debugPrint('REMOVE BAR => ${bar.toString()}');
    } catch (e) {
      debugPrint('REMOVE BAR ERROR => $e');
    }
  }
}
