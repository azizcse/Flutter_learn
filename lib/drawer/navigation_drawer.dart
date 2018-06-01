import 'package:flutter/material.dart';
import '../tabbar/tab_layout_page.dart';
import '../list_view/list_view_adapter.dart';
import '../model/Person.dart';


class DrawerItem{
  String name;
  IconData iconData;
  DrawerItem(this.name,this.iconData);
}

class NavigationDrawer extends StatelessWidget {

  final String title;
  final drawerItems = [
    new DrawerItem("Drawer Item 1", Icons.access_alarms),
  ]; 
  NavigationDrawer({
    Key key,
    this.title,
  }) :super(key: key);


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
            new UserAccountsDrawerHeader(
              accountName: new Text("Md Azizul Islam"),
              accountEmail: new Text("abc@gmail.com"),
              margin: const EdgeInsets.all(3.0),
              otherAccountsPictures: <Widget>[
                new IconButton(
                    icon: new Icon(Icons.access_alarms, color: Colors.deepPurple, size: 40.0,),
                    onPressed: () {
                      print("User image pressed");
                    })
              ],

              currentAccountPicture: new CircleAvatar(
                backgroundColor: Theme.of(context).accentColor,
                backgroundImage: new AssetImage("assets/profile_picture.jpg"),
              ),
            ),

            new ListTile(title: new Text("Drawer iten 1"),
              onTap: () {
                Navigator.pop(context);
                var person = Person.create(7878, "Aziz", "Bashupara", 34);
                var person2 = Person.create(7878, "Azihtz", "Bashupgfhara", 54);

                if (person == person2) {
                  print("Object are same");
                } else {
                  print("Object not same");
                }
              },
            ),
            new ListTile(
              title: new Text("List view and adapter"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => new SimpleApp()));
              },
            ),

            new ListTile(
              title: new Text("Tab layout"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => new TabBarDemo()));
              },
            ),
          ],
        ),
      ),
    );
  }
}