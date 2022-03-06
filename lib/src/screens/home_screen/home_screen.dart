import 'package:app_comanda/src/utils/colors_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor: ColorsUtil.beerBlack,
        ),
        body: Center(
          child:
              Lottie.asset('assets/lottie/order.json', width: 190, height: 190),
        ),
      ),
    );
  }
}
