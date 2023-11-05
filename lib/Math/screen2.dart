import 'package:flutter/material.dart';

class Ship extends StatefulWidget {
  const Ship({Key? key}) : super(key: key);

  @override
  State<Ship> createState() => _ShipState();
}

class _ShipState extends State<Ship> {
  bool answered = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 38.0, left: 18),
                  child: Container(
                    height: size.height*0.45,
                    width: size.width*0.87,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text("Count the \nspace Ships", style: TextStyle(fontSize: 55, fontFamily: "CabinSketch"),),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Image.asset('assets/ship.png', height: 165,)
                      ],
                    ),
                  ),
                ),
              ),
              answered ? Container(
                child: Image.asset('assets/gifs/1.gif'),
              ):
              Padding(
                padding: const EdgeInsets.all(88.0),
                child: Center(
                  child: Container(
                    height: size.height*0.34,
                    width: size.height*0.77,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              answered = true;

                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                              ),
                              child: Text("8", style: TextStyle(fontSize: 100, fontFamily: "CabinSketch")),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Oops that was wrong try again")));
                },
                          child: Padding(

                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                              ),
                              child: Text("4", style: TextStyle(fontSize: 100, fontFamily: "CabinSketch")),
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: (){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Oops that was wrong try again")));
                            },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                              ),
                              child: Text("7", style: TextStyle(fontSize: 100, fontFamily: "CabinSketch")),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}
