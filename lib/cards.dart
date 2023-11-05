import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseCard extends StatefulWidget {
  final void Function() onPressed;
  final String imagepath;
  final String title;
  const CourseCard({Key? key,required this.onPressed, required this.imagepath, required this.title}) : super(key: key);

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var contHeight = size.height*0.34;
    return InkWell(
      onTap: widget.onPressed,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: size.height*0.34,
          width: size.width*0.9,
          decoration: BoxDecoration(
            color: Color(0xffFDFDFD),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: contHeight*0.70,
                          //width: width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(widget.imagepath.toString(),)
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: contHeight*0.02,),
                      Container(
                        height: contHeight*0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(widget.title.toString(), style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 20),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: Container(

                                width: 133,
                                height: 45,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:[
                                    Container(
                                      width: 90,
                                      height: 42,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        color: Color(0xff009529),
                                      ),
                                      padding: const EdgeInsets.only(left: 10, right:10, ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children:[
                                          Text(
                                            "PLAY",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.13,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),


                    ],
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );;
  }

  Widget kwhiteButton(text1, text2, status, color){
    return Container(
        decoration: BoxDecoration(
            color: (status.darkTheme) ? Color(0xff4a4a4a) : color,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Color(0xd000000),
                  offset: Offset(0,10),
                  blurRadius: 15,
                  spreadRadius: 2
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: RichText(text: TextSpan(children: [
            TextSpan(
                text: '${text1}',
                style: GoogleFonts.poppins(color: (status.darkTheme) ? Colors.white : Colors.black87, fontWeight: FontWeight.w600, fontSize: 12)),
            TextSpan(
              text: '${text2}',
              style: GoogleFonts.poppins(color: (status.darkTheme) ? Colors.white : Colors.black87, fontWeight: FontWeight.w600, fontSize: 8, decoration: TextDecoration.lineThrough),)
          ]),
          ),)
    );
  }

}