import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoBox {
  List task = [];
  final box = Hive.box("initialBox");

  // first time using the todo and initial hive db
  void createInitialize() {
    task = [
      ["Slide to delete", false],
    ];
  }

  // create hive data
  void loadHiveDatabase() {
    task = box.get("TODO");
  }

  // update hive data
  void updateHiveDatabase(context) {
    box.put("TODO", task);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.amber,
        content: Text(
          "Updated Successfully",
          style: TextStyle(color: Colors.black),
        )));
  }

  // delete hive data
  void deleteHiveDatabase(int index) {
    task.removeAt(index);
  }
}
