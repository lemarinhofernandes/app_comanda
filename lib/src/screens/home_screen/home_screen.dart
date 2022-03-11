// ignore_for_file: prefer_const_constructors
import 'package:app_comanda/src/models/bar_model.dart';
import 'package:app_comanda/src/screens/home_screen/home_screen_controller.dart';
import 'package:app_comanda/src/utils/colors_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeScreenController _homeController = HomeScreenController();

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
            floatingActionButton: FloatingActionButton(
              backgroundColor: ColorsUtil.beerBlack,
              onPressed: () {
                _homeController.addBar(ComandaModel('bar ficticio'));
                setState(() {});
              },
              child: const Icon(Icons.add),
            ),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _homeController.listaMock
                      .map((bar) => _cardBar(bar))
                      .toList(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _cardBar(ComandaModel bar) {
    return Container(
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
            bar.nomeBar ?? 'Barzin',
            style: TextStyle(color: ColorsUtil.beerBlack),
          ),
          subtitle: Text('Total: R\$ ${bar.total}'),
          leading: Image.asset('assets/png/toast.png'),
          trailing: InkWell(
            onTap: () {
              _homeController.removeBar(bar);
              setState(() {});
            },
            child: Container(
              child: SvgPicture.network(
                'https://www.svgrepo.com/show/358329/trash.svg',
                color: Colors.red,
                placeholderBuilder: (_) => CircularProgressIndicator(),
              ),
            ),
          ),
        ));
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
