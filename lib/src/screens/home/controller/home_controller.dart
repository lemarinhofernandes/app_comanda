import 'package:app_comanda/src/models/comanda_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  List<ComandaModel> listaMock = <ComandaModel>[
    ComandaModel('bar', total: 50),
    ComandaModel('bar do padim', total: 200.0),
    ComandaModel('A Toca', total: 125.0),
  ];

  @action
  void addComanda(ComandaModel comanda) {
    try {
      listaMock.add(comanda);
      debugPrint('ADICIONA BAR => ${comanda.toString()}');
    } catch (e) {
      debugPrint('ADICIONA BAR ERROR => $e');
    }
  }

  @action
  void removeComanda(ComandaModel comanda) {
    try {
      listaMock.remove(comanda);
      debugPrint('REMOVE BAR => ${comanda.toString()}');
    } catch (e) {
      debugPrint('REMOVE BAR ERROR => $e');
    }
  }
}
