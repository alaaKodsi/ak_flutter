import 'package:aktest/main.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: LottieBuilder.asset(
              "assets/Lottie/Animation - 1706350772392.json",
            ),
          )
        ],
      ),
      nextScreen: const AkTest(),
      splashIconSize: 400,
      backgroundColor: const Color.fromARGB(255, 107, 159, 248),
    );
  }
}
