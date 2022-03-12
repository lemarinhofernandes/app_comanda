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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsUtil.beerBlack,
        title: Text('Nova comanda'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                'NOME',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: ColorsUtil.beerBlack),
              ),
              _textFieldWidget(nomeController),
              FloatingActionButton.extended(
                onPressed: () {
                  widget.homeController
                      ?.addComanda(ComandaModel(nomeController.text));
                  Navigator.of(context).pop();
                },
                label: Text(
                  '                            Salvar                            ',
                  style: TextStyle(color: ColorsUtil.appWhite),
                ),
                backgroundColor: ColorsUtil.beerBlack,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _textFieldWidget(TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: TextField(
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
