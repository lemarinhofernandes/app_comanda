import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoOrdersYet extends StatelessWidget {
  final Size size;
  const NoOrdersYet({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Center(
        child: Lottie.asset(
          'assets/lottie/order.json',
          repeat: false,
          width: 190,
          height: 190,
        ),
      ),
    );
  }
}
