import 'package:flutter/material.dart';
import 'package:klip/constants.dart';

class Boom extends StatefulWidget {
  const Boom({Key? key}) : super(key: key);

  @override
  State<Boom> createState() => _BoomState();
}

class _BoomState extends State<Boom> {
  List<String> images = ["assets/bet/a.png", "assets/bet/b.png", "assets/bet/c.png", "assets/bet/d.png","assets/bet/e.png","assets/bet/f.png"];
  List<String> words = ["apple","ball","cat","dog","elephant","fox"];
  TextEditingController _text = TextEditingController();
  bool show = false;


  int index = 0;
  PageController _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/yo.jpg"),
              fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
          body: Container(
        child: PageView.builder(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return index == 25? Container(child : Center(child: Text("Yay you did everything"))) :
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Image.asset(images[index]),
                        ),
                        Container(
                          child: Text("${words[index]}", style: kHeadingTextStyle.copyWith(color: Colors.redAccent),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10,2,10,2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black)
                            ),

                            child: TextField(
                              controller: _text,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Write the word",

                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(onPressed: (){
                          if(_text.text == words[index])
                          {
                            _controller.nextPage(duration: Duration(seconds: 1), curve: Curves.easeInOut);
                            _text.clear();
                            setState(() {
                              show = false;
                            });

                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Oops that was wrong try again")));
                          }

                        }, child: Text("Next")),
                        ElevatedButton(onPressed: (){
                          setState(() {
                            show = true;
                          });
                        }, child: Text("Reveal Answer?")),
                        show ? Text("Answer is : ${words[index]}"):
                            SizedBox(),
                      ],
                    ),
                  ),
                );
          },
        ),
      )),
    );

  }

}
