import 'package:app_comanda/src/models/comanda_model.dart';
import 'package:app_comanda/src/screens/cadastro_comanda/controller/cadastro_controller.dart';
import 'package:app_comanda/src/screens/home/controller/home_controller.dart';
import 'package:app_comanda/src/utils/colors_util.dart';
import 'package:flutter/material.dart';

class CadastroComanda extends StatefulWidget {
  const CadastroComanda({Key? key, this.homeController}) : super(key: key);

  final HomeController? homeController;

  @override
  State<CadastroComanda> createState() => _CadastroComandaState();
}

class _CadastroComandaState extends State<CadastroComanda> {
  CadastroController _controller = CadastroController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    nomeController;
    passwordController;
    super.initState();
  }

  @override
  void dispose() {
    nomeController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsUtil.beerBlack,
        title: const Text('Nova comanda'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Nome',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: ColorsUtil.beerBlack),
              ),
              _textFieldWidget(nomeController, false),
              const Text(
                'Senha',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: ColorsUtil.beerBlack),
              ),
              _textFieldWidget(passwordController, true),
              FloatingActionButton.extended(
                onPressed: () {
                  widget.homeController
                      ?.addComanda(ComandaModel(nomeController.text));
                  Navigator.of(context).pop();
                },
                label: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(Icons.save),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      'Salvar',
                      style: TextStyle(color: ColorsUtil.appWhite),
                    ),
                  ],
                ),
                backgroundColor: ColorsUtil.beerBlack,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _textFieldWidget(TextEditingController controller, bool senha) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(vertical: 24),
      child: TextField(
        obscureText: senha,
        textCapitalization: TextCapitalization.sentences,
        controller: controller,
        style: const TextStyle(fontSize: 18, letterSpacing: 1.2),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ColorsUtil.appGrey, width: 1.5),
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
