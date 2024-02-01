import 'package:flutter/material.dart';
import 'package:flutter_training/mixin/after_layout_mixin.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> with AfterLayoutMixin {
  @override
  void afterFirstLayout() {
    Future.delayed(const Duration(milliseconds: 500), () async {
      await Navigator.pushNamed(context, '/main');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
      body: SizedBox(),
    );
  }
}
