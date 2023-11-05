import 'package:flutter/material.dart';
import 'package:klip/Shape/shapeMatch.dart';
import 'package:klip/cards.dart';
import 'package:klip/color_match.dart';


class ShapeMatching extends StatefulWidget {
  const ShapeMatching({Key? key}) : super(key: key);

  @override
  State<ShapeMatching> createState() => _ShapeMatchingState();
}

class _ShapeMatchingState extends State<ShapeMatching> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/yo.jpg"),
            fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Container(
              height: size.height,
              width: size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: size.height*0.03,),
                    CourseCard(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ColorGame()),
                      );
                    }, imagepath: "assets/1.jpeg", title: "Match the Fruits"),

                    SizedBox(height: size.height*0.03,),
                    CourseCard(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ShapeMatch()),
                      );
                    }, imagepath: "assets/box.jpg", title: "Match the boxes"),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}
