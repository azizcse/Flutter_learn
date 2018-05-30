import 'package:flutter/material.dart';

class SimpleApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Simple App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SimpleAppPage(),
    );
  }
}


class SimpleAppPage extends StatefulWidget{
  SimpleAppPage({Key key}):super(key:key);
  @override
  _SimpleAppPageState createState() => new _SimpleAppPageState();
}

class _SimpleAppPageState extends State<SimpleAppPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample App"),
      ),
      body: new ListView(children: _getListData()),
    );
  }

  _getListData() {

    List<Widget> widgets = [];
    for (int i = 0; i < 100; i++) {
      widgets.add(new GestureDetector(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Icon(Icons.star, size: 50.0),
            new Icon(Icons.star, size: 50.0),
            new Icon(Icons.star, size: 50.0),
          ],
        ),
        onTap: () {
          print('row tapped');
        },
        onLongPress: (){
          print('row long press');
        },
      ));
    }
    return widgets;
  }
}