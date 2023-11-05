import 'dart:math';

import 'package:flutter/material.dart';

class PercentIndicator extends StatefulWidget {
  PercentIndicator({Key? key}) : super(key: key);

  @override
  _PercentIndicatorState createState() => _PercentIndicatorState();
}

class _PercentIndicatorState extends State<PercentIndicator> {
  ValueNotifier<double> testSlider = new ValueNotifier<double>(0);
  // let make slider to test
  // lets start coding!!.. :)
  // lets make painter for indicator

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[200],
        // Lets make widget Indicator
        // to big.. hahhaa
        child: SafeArea(
          child: Center(
            child: ValueListenableBuilder(
                valueListenable: testSlider,
                builder: (context, double slider, child) {
                  return Column(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        child: IndicatorWidget(
                          size: 50,
                          percentSizeInner: 0.5,
                          percentValue: slider,
                          bgLineColor: Colors.white,
                          child: Text("${(slider * 100).toStringAsFixed(0)} %"),
                        ),
                      ),
                      // should wrap with indicator also
                      Slider(
                        value: slider,
                        max: 1,
                        min: 0,
                        onChanged: (value) {
                          testSlider.value = value;
                          testSlider.notifyListeners();
                        },
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}

class IndicatorWidget extends StatefulWidget {
  double size;
  double percentSizeInner;
  double percentValue;
  Color lineColor;
  Color bgLineColor;
  Widget child;

  IndicatorWidget({
    Key? key,
    this.size = 50,
    this.percentSizeInner = 0.8,
    this.percentValue = 0.5,
    this.bgLineColor = Colors.white,
    this.lineColor = Colors.red,
    required this.child,
  }) : super(key: key);

  @override
  _IndicatorWidgetState createState() => _IndicatorWidgetState();
}

class _IndicatorWidgetState extends State<IndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        foregroundPainter: CustomIndicatorPainter(
          bgLineColor: widget.bgLineColor,
          lineColor: widget.lineColor,
          percentSizeInner: widget.percentSizeInner,
          percentValue: widget.percentValue,
          width: widget.size,
        ),
        child: Center(
          child: widget.child,
        ),
      ),
    );
  }
}

class CustomIndicatorPainter extends CustomPainter {
  double width;
  double percentSizeInner;
  double percentValue;
  Color lineColor;
  Color bgLineColor;

  CustomIndicatorPainter({
    required this.width,
    required this.percentSizeInner,
    required this.percentValue,
    required this.bgLineColor,
    required this.lineColor,
  });

// lets make line
// out indicator out range, if u can see, we fix it
  @override
  void paint(Canvas canvas, Size size) {
    Paint paintBgColor = Paint()
      ..color = this.bgLineColor
      ..strokeWidth = this.width
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    Paint paintLineColor = Paint()
      ..color = this.lineColor
      ..strokeWidth = this.percentSizeInner * this.width
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // indicator line percent angle
    double sweepAngle = pi * 2 * this.percentValue;
    double startAngle = pi * 0.5; // can change whatever u want start angle
    double radius = max(size.width / 2, size.height / 2) - width / 2;
    Offset centerOffset = Offset(size.width / 2, size.height / 2);

    // yeayyy
    canvas.drawCircle(centerOffset, radius, paintBgColor);
    canvas.drawArc(Rect.fromCircle(center: centerOffset, radius: radius),
        startAngle, sweepAngle, false, paintLineColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
