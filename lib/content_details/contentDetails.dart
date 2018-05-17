import 'package:flutter/material.dart';


void main() {
  //debugPaintSizeEnabled = true;
  runApp(new MyApp());
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  MyHomePageState createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  /*
  *  start counter by click
  * */

  void countStar() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          new IconButton(
            onPressed: countStar,
            icon: new Icon(Icons.star),
            color: Colors.red[500],
          ),
          new Text("$counter")
        ],
      ),
    );

    Column buttonBuilder(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new IconButton(
            onPressed: () {
              Scaffold.of(context).showSnackBar(
                new SnackBar(
                  content: new Text("Hello"),
                  action: new SnackBarAction(
                    label: "Undo",
                    onPressed: () =>
                        Scaffold.of(context).hideCurrentSnackBar(),
                  ),
                ),
              );
            },
            icon: new Icon(icon),
            color: color,
          ),
          new Container(
            margin: const EdgeInsets.only(top: 0.0),
            child: new Text(
              label,
              style: new TextStyle(
                  fontSize: 12.0, fontWeight: FontWeight.w400, color: color),
            ),
          )
        ],
      );
    }

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buttonBuilder(Icons.call, "Call"),
          buttonBuilder(Icons.near_me, "Route"),
          buttonBuilder(Icons.share, "Share"),
        ],
      ),
    );

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.00),
      child: new Text(
        '''
 Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one 
 of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest,
 leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
       ''',
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );

    return new MaterialApp(
      title: "Flutter design",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Complex design"),
        ),
        body: new ListView(
          children: <Widget>[
            new Image.asset(
              "images/lake.jpg",
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}
