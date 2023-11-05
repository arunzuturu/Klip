import 'package:flutter/material.dart';
import 'package:klip/Math/count.dart';
import 'package:klip/Math/screen1.dart';
import 'package:klip/Math/screen2.dart';
import 'package:klip/Math/screen3.dart';
import 'package:klip/Math/tut.dart';

class Math extends StatefulWidget {
  const Math({Key? key}) : super(key: key);

  @override
  State<Math> createState() => _MathState();
}

class _MathState extends State<Math> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: PageView(
            children: [
              Tut(),
              Sum(),
              Berrry(),
              Tut2(),
              Ship(),


            ],
          ),
        ),
      ),
    );
  }
}
