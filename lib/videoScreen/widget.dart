import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class WaterMarkWidget extends StatefulWidget {
  const WaterMarkWidget({super.key, required this.text});
  final String text;

  @override
  State<WaterMarkWidget> createState() => _WaterMarkWidgetState();
}

class _WaterMarkWidgetState extends State<WaterMarkWidget> {
  late Timer timer;
  double topPadding = 0;
  double downPadding = 0;
  int durationTime = 10000;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      timer = Timer.periodic(Duration(milliseconds: durationTime), (__) {
        double w = MediaQuery.of(context).size.width * .3;
        double h = MediaQuery.of(context).size.height * .1;
        topPadding = Random().nextDouble() * h;
        downPadding = Random().nextDouble() * w;
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: topPadding,
          left: downPadding,
          child: AnimatedContainer(
            duration: Duration(milliseconds: durationTime),
            padding: EdgeInsets.only(top: topPadding, left: downPadding),
            child: Center(
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}