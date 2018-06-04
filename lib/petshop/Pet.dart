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
  PetMainState createState() => new PetMainState();
}

List<PetModel> petList = <PetModel>[];

class PetMainState extends State<PetMain> {
  Choice _selectedChoice = choices[0];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Pet storage",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("PetShop"),
          actions: <Widget>[
            //over flow menu

            new PopupMenuButton<Choice>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.skip(0).map((Choice choice) {
                  return new PopupMenuItem<Choice>(
                    value: choice,
                    child: new Text(choice.title),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: new ListView(children: _getListData()),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new AddPet()),
            );
          },
          // ignore: argument_type_not_assignable
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
      String petName = petList[i].petName;
      String petType = petList[i].petType;
      widgets.add(new GestureDetector(
        child: new Padding(
            padding: new EdgeInsets.all(5.0),
            child: new ListTile(
              title: new Text("$petName"),
              subtitle: new Text("$petType"),
              leading: new CircleAvatar(child: new Text(petType[0])),
              onTap: () {
                setState(() {
                  /* Scaffold.of(context).showSnackBar(
                        new SnackBar(
                          content: new Text("$petName"),
                          action: new SnackBarAction(
                            label: "Undo",
                            onPressed: () =>
                                Scaffold.of(context).hideCurrentSnackBar(),
                          ),
                        ),
                      );*/

                  return showDialog(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return new AlertDialog(
                        title: new Text('Pet Details'),
                        content: new SingleChildScrollView(
                          child: new ListBody(
                            children: <Widget>[
                              new Text('Pet Name: $petName'),
                              new Text('Pet Type: $petType'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          new FlatButton(
                            child: new Text('ok'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                });
              },
            )),
      ));
    }
    return widgets;
  }

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;

      Scaffold.of(context).showSnackBar(
            new SnackBar(
              content: new Text(choice.title),
              action: new SnackBarAction(
                label: "Undo",
                onPressed: () => Scaffold.of(context).hideCurrentSnackBar(),
              ),
            ),
          );
    });
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
              onPressed: () {
                petList.add(
                    new PetModel(nameController.text, "", typeController.text));
                Navigator.pop(context);
              }),
        ],
      ),
      body: new Column(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Add A Pet name",
                labelText: "Pet Name: ",
              ),
              controller: nameController,
              keyboardType: TextInputType.text,
            ),
          ),
          new ListTile(
            title: new TextField(
              decoration: new InputDecoration(
                  hintText: "Add A Pet type", labelText: "Pet Type"),
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

class Choice {
  const Choice({this.title});

  final String title;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Delete'),
  const Choice(title: 'Bookmark'),
];
