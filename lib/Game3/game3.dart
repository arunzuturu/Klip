import 'package:flutter/material.dart';
import 'package:klip/Game3/shapes.dart';
import 'package:klip/Game3/stories.dart';

import 'alphabets.dart';
import 'card.dart';
import 'colors.dart';
import 'counting.dart';


class Word extends StatelessWidget {
  final List<Widget> _categories = [
    CategoryCard(
      title: 'Colors',
      primaryColor: Colors.orangeAccent,
      secondaryColor: Colors.orange,
      screen: ColorsScreen(
        title: 'Colors',
        primaryColor: Colors.orangeAccent,
        secondaryColor: Colors.orange,
      ),
    ),
    CategoryCard(
      title: '123',
      primaryColor: Colors.greenAccent,
      secondaryColor: Colors.green,
      screen: CountingScreen(
        title: '123',
        primaryColor: Colors.greenAccent,
        secondaryColor: Colors.green,
      ),
    ),
    CategoryCard(
      title: 'ABC',
      primaryColor: Colors.purpleAccent,
      secondaryColor: Colors.purple,
      screen: AlphabetsScreen(
        title: 'ABC',
        primaryColor: Colors.purpleAccent,
        secondaryColor: Colors.purple,
      ),
    ),
    // CategoryCard(
    //   title: 'Stories',
    //   primaryColor: Color(0xFF3383CD),
    //   secondaryColor: Color(0xFF11249F),
    //   screen: StoriesScreen(
    //     title: 'Stories',
    //     primaryColor: Color(0xFF3383CD),
    //     secondaryColor: Color(0xFF11249F),
    //   ),
    // ),
    // CategoryCard(
    //   title: 'Shapes',
    //   primaryColor: Colors.redAccent,
    //   secondaryColor: Colors.red,
    //   screen: ShapesScreen(
    //     title: 'Shapes',
    //     primaryColor: Colors.redAccent,
    //     secondaryColor: Colors.red,
    //   ),
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
          image: DecorationImage(
            image: AssetImage('assets/images/bg-bottom.png'),
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 188.0,
              backgroundColor: Colors.grey[50],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/bg-top.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(_categories),
            ),
          ],
        ),
      ),
    );
  }
}