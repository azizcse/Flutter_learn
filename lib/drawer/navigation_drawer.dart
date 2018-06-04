import 'package:flutter/material.dart';
import '../tabbar/tab_layout_page.dart';
import '../list_view/list_view_adapter.dart';
import '../model/Person.dart';
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