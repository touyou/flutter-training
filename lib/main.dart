import 'package:flutter/material.dart';
import 'package:flutter_training/pages/main_page.dart';
import 'package:flutter_training/pages/splash_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          '/main': (context) => const MainPage(),
        },
      ),
    ),
  );
}
