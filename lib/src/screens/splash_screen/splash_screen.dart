import 'package:app_comanda/src/components/customPageRoute_widget.dart';
import 'package:app_comanda/src/screens/home/home_screen.dart';
import 'package:app_comanda/src/utils/colors_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _beerController;
  bool copAnimated = false;
  bool animateBeerText = false;

  @override
  void initState() {
    super.initState();
    _beerController = AnimationController(vsync: this);
    _beerController.addListener(() {
      if (_beerController.value > 0.7) {
        _beerController.stop();
        copAnimated = true;
        setState(() {});
        Future.delayed(const Duration(seconds: 1), () {
          animateBeerText = true;
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _beerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorsUtil.appGrey,
      body: Stack(
        children: [
          // White Container top half
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: copAnimated ? screenHeight / 1.9 : screenHeight,
            decoration: BoxDecoration(
              color: ColorsUtil.beerBlack,
              borderRadius: BorderRadius.circular(copAnimated ? 40.0 : 0.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Visibility(
                  visible: !copAnimated,
                  child: Lottie.asset(
                    'assets/lottie/cheers.json',
                    controller: _beerController,
                    onLoaded: (composition) {
                      _beerController
                        ..duration = composition.duration
                        ..forward();
                    },
                  ),
                ),
                Visibility(
                    visible: copAnimated,
                    child: Lottie.asset(
                      'assets/lottie/cheers.json',
                      animate: false,
                      width: 190,
                      height: 190,
                    )),
                Center(
                  child: AnimatedOpacity(
                    opacity: animateBeerText ? 1 : 0,
                    duration: const Duration(seconds: 1),
                    child: const Text(
                      '',
                      style:
                          TextStyle(fontSize: 50.0, color: ColorsUtil.appGrey),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Text bottom part
          Visibility(visible: copAnimated, child: const _BottomPart()),
        ],
      ),
    );
  }
}

class _BottomPart extends StatefulWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  State<_BottomPart> createState() => _BottomPartState();
}

class _BottomPartState extends State<_BottomPart> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Que tal começar a sua primeira comanda?',
              style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold,
                  color: ColorsUtil.beerBlack),
            ),
            const SizedBox(height: 30.0),
            Text(
              'Basta clicar no botão e avançar para a próxima pagina.',
              style: TextStyle(
                fontSize: 15.0,
                color: ColorsUtil.beerBlack.withOpacity(0.8),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 50.0),
            Align(
              alignment: Alignment.centerRight,
              child: _nextPageButton(),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget _nextPageButton() {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(40)),
      onTap: () => Navigator.pushReplacement(
          context, CustomPageRouter(child: const HomePage())),
      child: Container(
        height: 85.0,
        width: 85.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: ColorsUtil.beerBlack, width: 2.0),
        ),
        child: const Icon(
          Icons.chevron_right,
          size: 50.0,
          color: ColorsUtil.beerBlack,
        ),
      ),
    );
  }
}
