import 'package:flutter/material.dart';
import 'package:klip/Game3/game3.dart';
import 'package:klip/Puzzle/game4.dart';
import 'package:klip/Shape/puzzleJigsaw.dart';
import 'package:klip/cards.dart';
import 'package:klip/shape_match.dart';
import 'Game4/homepage.dart';
import 'Math/math.dart';
import 'Word Game/word.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bgmain.jpg"),
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
                      MaterialPageRoute(builder: (context) =>  Word()),
                    );
                  }, imagepath: "assets/3.jpeg", title: "Learn ABC"),
                  SizedBox(height: size.height*0.03,),
                  CourseCard(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Mem()),
                    );
                  }, imagepath: "assets/2.jpg", title: "Find the animals"),
                  SizedBox(height: size.height*0.03,),
                  CourseCard(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  ShapeMatching()),
                    );
                  }, imagepath: "assets/matching.png", title: "Matching Games!!"),
                  SizedBox(height: size.height*0.03,),
                  CourseCard(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  PuzzleWidget()),
                    );
                  }, imagepath: "assets/puzzle.png", title: "Animal Puzzle"),
                  SizedBox(height: size.height*0.03,),
                  CourseCard(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Boom()),
                    );
                  }, imagepath: "assets/words.jpg", title: "Learn Words"),
                  SizedBox(height: size.height*0.03,),
                  CourseCard(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Math()),
                    );
                  }, imagepath: "assets/math.jpg", title: "Math Game"),
                  SizedBox(height: size.height*0.03,),
                  CourseCard(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  DragPicture()),
                    );
                  }, imagepath: "assets/opp.jpg", title: "Drag Animals"),

                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}
