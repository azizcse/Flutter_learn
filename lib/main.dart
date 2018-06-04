import 'package:flutter/material.dart';
import 'drawer/navigation_drawer.dart';
import 'content_details/contentDetails.dart';
import 'page/home_page.dart';
import 'petshop//Pet.dart';
import 'exercise/exercise_file.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final String title = "Flutter Demo";
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: new NavigationDrawer(title: 'Flutter Demo Home Page'),
       // home: new MyHomePage(),
       // home: new HomePage(),
     /* home: new Scaffold(
        body: new PetMain(),
      )*/

     home: new BasicAppBarSample(),
    );
  }
}
