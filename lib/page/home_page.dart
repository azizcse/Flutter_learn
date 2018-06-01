import 'package:flutter/material.dart';
import '../fragment/first_fragemtn.dart';
import '../fragment/second_fragment.dart';
import '../fragment/third_fragment.dart';

class DrawerItem {
  String name;
  IconData iconData;

  DrawerItem(this.name, this.iconData);
}

class HomePage extends StatefulWidget {
  final drawerItem = [
    new DrawerItem("Drawer Item 1", Icons.print),
    new DrawerItem("Drawer Item 2", Icons.access_alarm),
    new DrawerItem("Drawer Item 3", Icons.person)
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }

}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int index) {
    switch (index) {
      case 0:
        return new FirstFragment();
      case 1:
        return new SecondFragment();
      case 2:
        return new ThirdFragment();
      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];

    for (int i = 0; i < widget.drawerItem.length; i++) {
      var d = widget.drawerItem[i];
      drawerOptions.add(
          new ListTile(
            leading: new Icon(d.iconData),
            title: new Text(d.name),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.drawerItem[_selectedDrawerIndex].name),),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[new UserAccountsDrawerHeader(
            accountName: new Text("Md Azizul Islam"),
            accountEmail: new Text("abd.@gmail.com"),
            currentAccountPicture:new CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              backgroundImage: new AssetImage("assets/profile_picture.jpg"),
            ),
          ),
          new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }

}