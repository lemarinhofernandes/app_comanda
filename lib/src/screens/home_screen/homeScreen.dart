// ignore_for_file: prefer_const_constructors
import 'package:app_comanda/src/screens/home_screen/homeScreen_controller.dart';
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
            backgroundColor: ColorsUtil.beerBlack,
            appBar: _buildAppBar(),
            body: _buildBody(),
            floatingActionButton: FloatingActionButton(
              backgroundColor: ColorsUtil.beerBlack,
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ),
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Center(
        child: Image.asset(
          'assets/png/tchollas-logo.png',
          height: 60,
          fit: BoxFit.contain,
        ),
      ),
    );
    // title: SizedBox(
    //     height: 10, child: SvgPicture.asset('assets/svg/Trash.svg')));
  }

  Widget _buildBody() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, mainAxisSpacing: 10, childAspectRatio: 4),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(
                          blurRadius: 1,
                          color: Color(0xFFF3B1F4),
                          spreadRadius: 1,
                          offset: Offset(2, 2))
                    ],
                    color: ColorsUtil.appWhite,
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  title: Text('Bar Tcholas Gaming'),
                  subtitle: Text('Total: R\$ 260.0'),
                  leading: Image.asset('assets/png/toast.png'),
                  trailing: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffB0B0B0),
                      // borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.network(
                      'https://www.svgrepo.com/show/358329/trash.svg',
                      color: Colors.red,
                      placeholderBuilder: (context) =>
                          CircularProgressIndicator(),
                    ),
                  ),
                ));
          }),
    );
  }
}
