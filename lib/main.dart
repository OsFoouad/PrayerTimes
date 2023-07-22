// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names, unused_local_variable,, unused_import

import 'package:prayers_times/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:prayers_times/theme/lightTheme.dart';
import 'package:prayers_times/theme/themeNotifier.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(lightTheme, "assets/images/background.jpg",
          "assets/images/masged1.png"),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final imageAssetPath = themeNotifier.getImageAssetPath();
    final masgedImageAsset = themeNotifier.getMasgedImageAsset();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: themeNotifier.getTheme(),
    );
  }
}
