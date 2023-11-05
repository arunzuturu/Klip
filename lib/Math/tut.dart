import 'package:flutter/material.dart';

class Tut extends StatefulWidget {
  const Tut({Key? key}) : super(key: key);

  @override
  State<Tut> createState() => _TutState();
}

class _TutState extends State<Tut> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Add"),
              Container(
                width: size.width*0.96,
                height: size.height*0.47,
                child: Image.asset('assets/gifs/add.gif'),
              ),
              Text("Sub"),
              Container(
                width: size.width*0.96,
                height: size.height*0.47,
                child: Image.asset('assets/gifs/sub.gif'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
