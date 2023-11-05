import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Sum extends StatefulWidget {
  const Sum({Key? key}) : super(key: key);

  @override
  State<Sum> createState() => _SumState();
}

class _SumState extends State<Sum> {
  bool answered = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/gifs/"),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 38.0, left: 18),
                    child: Container(
                      height: size.height*0.35,
                      width: size.width*0.87,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/bet/a.png',height: 120,),
                              Text("+", style: TextStyle(fontSize: 45),),
                              Image.asset("assets/apples.png", height: 124,)
                            ],
                          ),
                          Row(
                            children: [
                              Text("1", style: TextStyle(fontSize: 100, fontFamily: "CabinSketch"),),
                              Text("+", style: TextStyle(fontSize: 100,fontFamily: "CabinSketch"),),
                              Text("3 = ?", style: TextStyle(fontSize: 100,fontFamily: "CabinSketch"),),
                            ],
                          ),
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
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Oops that was wrong try again")));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.red),
                                    ),
                                    child: Text("2", style: TextStyle(fontSize: 100, fontFamily: "CabinSketch")),
                                  ),
                                ),
                              ),
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
      ),
    );
  }
}
