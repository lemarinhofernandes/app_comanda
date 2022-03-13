import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'cadastro_controller.g.dart';

class CadastroController = _CadastroControllerBase with _$CadastroController;

abstract class _CadastroControllerBase with Store {
  @observable
  late TextEditingController textoNomeController;

  @computed
  String get textoNome => textoNomeController.text;
}
