// ignore_for_file: prefer_const_constructors
import 'package:app_comanda/src/components/customPageRoute_widget.dart';
import 'package:app_comanda/src/models/comanda_model.dart';
import 'package:app_comanda/src/screens/cadastro_comanda/cadastro_comanda.dart';
import 'package:app_comanda/src/screens/comanda/comanda_screen.dart';
import 'package:app_comanda/src/utils/colors_util.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = HomeController();

  @override
  void initState() {
    _homeController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: ColorsUtil.appGrey,
            appBar: _buildAppBar(),
            body: _buildBody(),
            floatingActionButton: Observer(builder: (_) {
              return FloatingActionButton(
                backgroundColor: ColorsUtil.beerBlack,
                onPressed: () {
                  Navigator.of(context).push(CustomPageRouter(
                      child: CadastroComanda(
                        homeController: _homeController,
                      ),
                      direction: AxisDirection.up));
                },
                child: const Icon(Icons.add),
              );
            }),
          ),
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: 0,
      backgroundColor: Colors.transparent,
    );
    // title: SizedBox(
    //     height: 10, child: SvgPicture.asset('assets/svg/Trash.svg')));
  }

  Widget _buildBody() {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            _buildHeader(),
            ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              shrinkWrap: true,
              children: [
                Observer(
                    name: 'suspeito',
                    builder: (_) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _homeController.listaMock
                            .map((bar) => _cardBar(bar))
                            .toList(),
                      );
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardBar(ComandaModel comanda) {
    return InkWell(
      onTap: () =>
          Navigator.of(context).push(CustomPageRouter(child: ComandaScreen())),
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                const BoxShadow(
                    blurRadius: 4,
                    color: ColorsUtil.beerBlack,
                    spreadRadius: 0.5,
                    offset: Offset(0, 4))
              ],
              color: ColorsUtil.appWhite,
              border: Border.all(color: ColorsUtil.beerBlack, width: 2),
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            title: Text(
              comanda.nomeBar ?? 'Barzin',
              style: TextStyle(color: ColorsUtil.beerBlack),
            ),
            subtitle: Text('Total: R\$ ${comanda.total}'),
            leading: Image.asset('assets/png/toast.png'),
            trailing: Observer(builder: (_) {
              return InkWell(
                onTap: () {
                  _homeController.removeComanda(comanda);
                  setState(() {});
                },
                child: Container(
                  child: SvgPicture.network(
                    'https://www.svgrepo.com/show/151015/trash-black-shape.svg',
                    height: 24,
                    width: 24,
                    color: ColorsUtil.beerBlack,
                    placeholderBuilder: (_) => CircularProgressIndicator(),
                  ),
                ),
              );
            }),
          )),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/png/tchollas-logo.png',
            fit: BoxFit.contain,
            width: 60,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Comandas',
            style: TextStyle(
                color: ColorsUtil.appGrey,
                fontWeight: FontWeight.w700,
                fontSize: 32,
                // ignore: prefer_const_literals_to_create_immutables
                shadows: [
                  Shadow(
                      // bottomLeft
                      offset: Offset(-1.5, -1.5),
                      color: ColorsUtil.beerBlack),
                  Shadow(
                      // bottomRight
                      offset: Offset(1.5, -1.5),
                      color: ColorsUtil.beerBlack),
                  Shadow(
                      // topRight
                      offset: Offset(1.5, 1.5),
                      color: ColorsUtil.beerBlack),
                  Shadow(
                      // topLeft
                      offset: Offset(-1.5, 1.5),
                      color: ColorsUtil.beerBlack),
                ]),
          )
        ],
      ),
    );
  }
}
