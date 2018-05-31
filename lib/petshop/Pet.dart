import 'package:flutter/material.dart';


/*
* In this section i am showing
*
* 1. Using generic list.
* 2. Model class
* 3. List view
* 4. Edit text
* 5. Get Text From edt text
*
*
*
*
* */
class PetMain extends StatefulWidget {
  PetMain();

  @override
  createState() => new PetMainState();
}

List<PetModel> petList = <PetModel>[];

class PetMainState extends State<PetMain> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Pet storage",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("PetShop"),
        ),
        body: new ListView(
          children:_getListData()
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new AddPet()),
            );
          },
          child: new Icon(
            Icons.add,
          ),
          backgroundColor: Colors.red,
        ),
      ),
    );
  }


  _getListData() {
    List<Widget> widgets = [];
    for (int i = 0; i < petList.length; i++) {
      String petName= petList[i].petName;
      String petType= petList[i].petType;
      widgets.add(
        new GestureDetector(
          child: new Padding(
                padding: new EdgeInsets.all(5.0),
                child: new ListTile(
                  title: new Text("$petName"),
                  subtitle: new Text("$petType"),
                )
            ),
          onTap: (){
            setState(() {
              print("$petName");
            });
          },
        )
      );
    }
    return widgets;
  }


}

/*
* Edit text class
* */

class AddPet extends StatelessWidget {
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController typeController = new TextEditingController();
  String petName, petType;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Add Pet"),
        actions: <Widget>[
          new IconButton(
              icon: const Icon(Icons.check),
              onPressed: (){
                petList.add(new PetModel(nameController.text, "", typeController.text));
                Navigator.pop(context);
              }
          ),
        ],
      ),
      body: new Column(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              decoration: new InputDecoration(
                  hintText: "Add A Pet name",
                  labelText: "Pet Name: "
              ),
              controller: nameController,

            ),

          ),
          new ListTile(
            title: new TextField(
              decoration: new InputDecoration(
                  hintText: "Add A Pet type",
                  labelText: "Pet Type"),
              controller: typeController,
            ),
          ),
          new ListTile(
            title: new TextField(
              decoration: new InputDecoration(
                  hintText: "Add A Pet color", labelText: "Pet color"),
            ),
          ),
        ],
      ),
    );
  }
}

/*
* Model Class
* */

class PetModel {
  final String petName;
  final String petColor;
  final String petType;

  PetModel(this.petName, this.petColor, this.petType);
}
