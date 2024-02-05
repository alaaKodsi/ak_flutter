import 'package:aktest/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class AkTest extends StatefulWidget {
  const AkTest({super.key});

  @override
  State<AkTest> createState() => _AkTestState();
}

class _AkTestState extends State<AkTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text(
            "AK Flutter",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Center(child: Image.asset("assets/image/AK Flutter.png")));
  }
}
