// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

class QiblahDireView extends StatefulWidget {
  const QiblahDireView({super.key});

  @override
  State<QiblahDireView> createState() => _QiblahDireViewState();
}

Animation<double>? animation;
AnimationController? _animationController;
double begin = 0.0;

class _QiblahDireViewState extends State<QiblahDireView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
            stream: FlutterQiblah.qiblahStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              final qiblaDirection = snapshot.data;
              animation = Tween(
                begin: begin,
                end: (qiblaDirection!.qiblah * (pi / 100) * -1),
              ).animate(_animationController!);

              begin = (qiblaDirection.qiblah * (pi / 100) * -1);
              _animationController!.forward(from: 0);

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Qiblah Compass",
                      style: TextStyle(fontSize: 20),
                    ),
                    AnimatedBuilder(
                      animation: animation!,
                      builder: (context, child) => Transform.rotate(
                        angle: animation!.value,
                        child: Image.asset(
                            height: 300, 'assets/images/qiblahCompass.png'),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
