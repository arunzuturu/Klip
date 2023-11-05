import 'dart:math';
import 'package:flutter/material.dart';

class ShapeMatch extends StatefulWidget {
  ShapeMatch({Key? key}) : super(key: key);

  @override
  _ShapeMatchState createState() => _ShapeMatchState();
}

class _ShapeMatchState extends State<ShapeMatch> {
  GlobalKey<_ShapeMatchWidgetState> globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return ShapeMatchWidget(
                    key: globalKey,
                    size: constraints.biggest,
                    // sent size for easy setup..sory for visibility comments
                  );
                },
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  globalKey.currentState!.generateList();
                },
                child: Text("Reload"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ShapeMatchWidget extends StatefulWidget {
  Size size;

  ShapeMatchWidget({Key? key, required this.size}) : super(key: key);

  @override
  _ShapeMatchWidgetState createState() => _ShapeMatchWidgetState();
}

class _ShapeMatchWidgetState extends State<ShapeMatchWidget>
    with SingleTickerProviderStateMixin {
  Size? size;
  List<ClassShape>? classShapes;
  int idx = 0;

  Offset? offsetTouch;
  Offset? currentOffsetCurrent;
  int? indexChild;
  Animation<double> ?animation;
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      value: 0,
      vsync: this,
    );

    animation = Tween<double>(begin: 0, end: 1).animate(animationController!)
      ..addListener(() {
        // check if index child is null
        if (indexChild != null) {
          ClassShape currentShape =
              classShapes!.firstWhere((shape) => shape.uniqueId == indexChild);

          // we need make calculate so can move shape
          currentShape.currentPos = pointAtPercent(
            currentOffsetCurrent!,
            currentShape.pointOrigin,
            animation!.value,
          );

          // check if animation ending
          if (animation!.isCompleted) {
            currentShape.color = Colors.yellow;

            offsetTouch = null;
            indexChild = null;
            animationController!.stop();
            animationController!.reset();
          }

          setState(() {});

          // yeayyy.. let make effect line
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    size = widget.size;

    if (classShapes == null) generateList();
    // let declare ondrag

    return Listener(
      onPointerUp: (event) {
        // for cancel event/return back
        // make animation
        if (indexChild != null) {
          ClassShape currentShape =
              classShapes!.firstWhere((shape) => shape.uniqueId == indexChild);
          currentOffsetCurrent = currentShape.currentPos;
          animationController!.value = 0;
          // play animation when user up touch
          animationController!.forward();
          setState(() {});
        }
      },
      onPointerMove: (event) {
        // check offsetTouch / indexChild null 1st
        if (offsetTouch != null && indexChild != null) {
          // check if current shape arrive at destination
          ClassShape currentShape =
              classShapes!.firstWhere((shape) => shape.uniqueId == indexChild);

          if (currentShape.arriveDest()) {
            // set done
            currentShape.setDone();
            indexChild = null;
          } else {
            // if not.. move current position
            currentShape.currentPos = event.localPosition - offsetTouch!;
          }

          // yeayyy.. let make it back to old pos if not arrive at destination
          setState(() {});
        }
      },
      child: Container(
        child: CustomPaint(
          painter: CustomPainterLine(classShapes!),
          child: Stack(
            children: [
              if (classShapes!.length > 0)
                ...classShapes!.asMap().entries.map((row) {
                  ClassShape shape = row.value;
                  return Positioned(
                    left: shape.defaultPos.dx,
                    top: shape.defaultPos.dy,
                    child: Container(
                      color: Colors.grey,
                      width: shape.childSize!.width,
                      height: shape.childSize!.height,
                      alignment: Alignment.topCenter,
                      child: Center(
                        child: Text(
                          shape.titleShape.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                }).toList(),

              // hmmm .. current pos not go btm..

              // lets declare shape to move
              if (classShapes!.length > 0)
                ...classShapes!.asMap().entries.map((row) {
                  ClassShape shape = row.value;

                  return Positioned(
                    left: shape.currentPos!.dx,
                    top: shape.currentPos!.dy,
                    child: Listener(
                      // get touch down pos
                      onPointerDown: (event) {
                        // check if shape is done 1st.. return will ignore action btm
                        if (shape.isDone == true) return;

                        shape.color = Colors.red;
                        // reorder so current touch on top
                        ClassShape temp = classShapes!.removeAt(row.key);
                        classShapes!.insert(0, temp);

                        // save current position
                        offsetTouch = event.localPosition;
                        // save current id shape touch
                        indexChild = shape.uniqueId;

                        print("Current touch down uniqueId : $indexChild");
                        setState(() {});
                      },
                      child: Column(
                        children: [
                          Container(
                            width: shape.childSize!.width,
                            height: shape.childSize!.height,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Offset pointAtPercent(Offset from, Offset target, double percent) {
    return Offset(
      from.dx + (target.dx - from.dx) * percent,
      from.dy + (target.dy - from.dy) * percent,
    );
  }

  void generateList() {
    // sorry.. haha
    print("will refresh shapes list later");

    // set min Shape Size
    double width = 80;
    double height = 80;
    double padding = 10;

    classShapes = <ClassShape>[];

    // calculate how many shape can fit on current width using min size
    int totalShape = size!.width ~/ (width + padding * 2);

    // generate fixed width for current size
    width = (size!.width - (padding * 2) * totalShape) / totalShape;
    height = width; // trick make height same as width.. haha
    // height = (size.height - (padding * 2) * totalShape) / totalShape;

    // let calculate pos for each shape
    for (var i = 0; i < totalShape; i++) {
      Offset offset =
          Offset((i + 1) * padding + (width + padding) * i, padding);

      Offset currentPos = Offset(
        ((i + 1) * padding + (width + padding) * i),
        size!.height - height - (padding * 1),
      );

      // create new ClassShape
      ClassShape classShape = ClassShape(
        titleShape: "${i + 1}",
        childSize: Size(width, height),
        currentPos: currentPos,
        defaultPos: offset,
        pointOrigin: currentPos,
        pathImage: "sample image",
        uniqueId: new Random().nextInt(1000000),
      );

      classShapes!.add(classShape);
    }

    // lets shuffle list 1st
    classShapes!.shuffle();

    // set new current / point pos after shuffle
    int count = 0;
    classShapes = classShapes!.map((shape) {
      // wrong..need use current one.. haha
      Offset currentPos = Offset(
        ((count + 1) * padding + (width + padding) * count),
        size!.height - height - (padding * 1),
      );

      shape.currentPos = currentPos;
      shape.pointOrigin = currentPos;

      // nice one... lets make it move when we touch / drag on them
      // thanks for watching

      count++;
      return shape;
    }).toList();

    // rebuild
    setState(() {});

    print("Size list ${classShapes!.length}");
  }
}

class CustomPainterLine extends CustomPainter {
  List<ClassShape> classShapes;
  CustomPainterLine(this.classShapes);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    this.classShapes.forEach((shape) {
      Path path = new Path();
      paint.color = shape.color;

      path.moveTo(
        shape.pointOrigin!.dx + shape.childSize!.width / 2,
        shape.pointOrigin!.dy + shape.childSize!.height / 2,
      );
      path.lineTo(
        shape.currentPos!.dx + shape.childSize!.width / 2,
        shape.currentPos!.dy + shape.childSize!.height / 2,
      );

      canvas.drawPath(path, paint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// lets declare class

class ClassShape {
  Offset? currentPos;
  Offset defaultPos;
  Offset pointOrigin;
  Size ?childSize;
  String? pathImage;
  String? titleShape;
  bool? isDone;
  int? uniqueId;

  MaterialColor color;

  ClassShape({
    this.pathImage,
    this.currentPos,
    this.childSize,
    this.color = Colors.yellow, //set default
    required this.defaultPos,
    this.isDone = false,
    required this.pointOrigin,
    this.titleShape,
    this.uniqueId,
  });

  // condition for shape move to correct destination
  bool arriveDest() => (this.currentPos! - this.defaultPos).distance < 15;

  void setDone() {
    this.isDone = true;
    this.color = Colors.green;
    this.currentPos = this.defaultPos;
  }
}
