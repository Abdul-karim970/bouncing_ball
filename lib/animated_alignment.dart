import 'package:flutter/material.dart';

class MyAnimatedAlignment extends StatefulWidget {
  const MyAnimatedAlignment({super.key});

  @override
  State<MyAnimatedAlignment> createState() => _MyAnimatedAlignmentState();
}

class _MyAnimatedAlignmentState extends State<MyAnimatedAlignment> {
  double boxWidth = 50;
  double boxHeight = 50;
  double dx = 0;
  double dy = -0.75;
  double radius = 360;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return AnimatedAlign(
        alignment: Alignment(dx, dy),
        duration: const Duration(milliseconds: 500),
        child: GestureDetector(
          onTap: () async {
            if (boxWidth == 50) {
              setState(() {
                dy = 0;
              });
              await Future.delayed(const Duration(milliseconds: 500));
              setState(() {
                dy = -0.5;
              });
              await Future.delayed(const Duration(milliseconds: 500));
              setState(() {
                dy = 0;
              });
              await Future.delayed(const Duration(milliseconds: 500));
              setState(() {
                dy = -0.3;
              });

              await Future.delayed(const Duration(milliseconds: 500));
              setState(() {
                boxWidth = width;
                boxHeight = height;
                dy = -0.75;
                radius = 0;
              });
            } else {
              setState(() {
                radius = 360;
                boxWidth = 50;
                boxHeight = 50;
              });
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: boxWidth,
            height: boxHeight,
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(radius)),
          ),
        ));
  }
}
