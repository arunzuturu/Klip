import 'package:flutter/material.dart';
import 'package:klip/menu.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/on.png'),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height*0.14,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText(
                        'Welcome to KLIP',
                        textStyle: const TextStyle(
                          fontFamily: "CabinSketch",
                          fontSize: 45.0,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 500), colors: [Colors.white,Colors.blue, Colors.red, Colors.yellow, Colors.greenAccent],
                      ),
                    ],

                    totalRepeatCount: 4,
                    pause: const Duration(milliseconds: 70),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),
                ),
                Text("Kids Learning app",style: TextStyle(fontFamily: "CabinSketch", fontWeight: FontWeight.bold, fontSize: 34, color: Colors.white),),
                SizedBox(height: size.height*0.1,),
                InkWell(
                  onTap:  (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Menu()),
                    );
                  },
                    child: Image.asset('assets/play.png')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
