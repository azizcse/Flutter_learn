import 'package:meta/meta.dart';
class Person{
  static final table_name = "user";

  static final column_id = "user_id";
  static final column_name = "user_anme";
  static final column_addr = "user_addr";
  static final column_age = "user_age";

  int id , age;
  String name, address;

  Person.create(this.id, this.name, this.address, this.age);

  Person.update({@required this.id, name = "", colorName = ""}) {
    if (name != "") {
      this.name = name;
    }
    if (colorName != "") {
      this.address = colorName;
    }
  }

  bool operator ==(o) => o is Person && o.id == id;

}