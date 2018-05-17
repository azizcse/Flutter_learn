import 'package:flutter/material.dart';
import '../tabbar/tab_layout_page.dart';
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
      body: new Center(child: new Text("Flutter page"),),

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
              title: new Text("Drawer Item 2"),
              onTap: (){
                Navigator.pop(context);
              },
            ),

            new ListTile(
              title: new Text("Drawer Item 3"),
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