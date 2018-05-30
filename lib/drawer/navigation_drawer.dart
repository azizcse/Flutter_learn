import 'package:flutter/material.dart';
import '../tabbar/tab_layout_page.dart';
import '../list_view/list_view_adapter.dart';
class NavigationDrawer extends StatelessWidget{

  final String title;

  NavigationDrawer({
    Key key,
    this.title,
  }):super(key : key);


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),

      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Material(color: Colors.yellowAccent),
          Positioned(
            top: 0.0,
            left: 0.0,
            child: Icon(Icons.star, size: 50.0),
          ),
          Positioned(
            top: 380.0,
            left: 270.0,
            child: Icon(Icons.call, size: 50.0),
          ),
        ],
      ),

      drawer: new Drawer(
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new DrawerHeader(child: new Text("Drawer Header"),
              decoration: new BoxDecoration(
                color: Colors.blue,
              ),
            ),
            
            new ListTile(title: new Text("Drawer iten 1"),
            onTap: (){
              Navigator.pop(context);
            },
            ),
            new ListTile(
              title: new Text("List view and adapter"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new SimpleApp()));
              },
            ),

            new ListTile(
              title: new Text("Tab layout"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new TabBarDemo()));
              },
            ),
          ],
        ),
      ),
    );
  }
}