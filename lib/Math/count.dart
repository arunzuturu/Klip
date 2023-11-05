import 'package:flutter/material.dart';

class Tut2 extends StatefulWidget {
  const Tut2({Key? key}) : super(key: key);

  @override
  State<Tut2> createState() => _Tut2State();
}

class _Tut2State extends State<Tut2> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Learn Counting!"),
              Container(
                width: size.width*0.96,
                height: size.height*0.47,
                child: Image.asset('assets/gifs/count.gif'),
              ),
              Container(
                width: size.width*0.96,
                height: size.height*0.47,
                child: Image.asset('assets/gifs/count2.gif'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}