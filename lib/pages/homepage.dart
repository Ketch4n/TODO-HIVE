import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_hive/components/dialog_box.dart';
import 'package:todo_hive/components/todo_tiles.dart';
import 'package:todo_hive/database/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final box = Hive.box("initialBox");
  final controller = TextEditingController();
  ToDoBox db = ToDoBox();

  @override
  void initState() {
    checkIfFirst();
    super.initState();
  }

  checkIfFirst() {
    if (box.get("TODO") == null) {
      db.createInitialize();
    } else {
      db.loadHiveDatabase();
    }
  }

  void checkbox(bool? value, int index) {
    setState(() {
      db.task[index][1] = !db.task[index][1];
      db.updateHiveDatabase(context);
    });
  }

  void addNewTask() {
    showDialog(
      context: context,
      builder: ((context) => DialogBox(
            save: () {
              if (controller.text.isNotEmpty) {
                db.task.add([controller.text, false]);
                setState(() {
                  db.updateHiveDatabase(context);
                  controller.clear();
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Cannot add empty task"),
                  ),
                );
              }

              Navigator.of(context).pop();
            },
            cancel: () {
              Navigator.of(context).pop();
            },
            controller: controller,
          )),
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.deleteHiveDatabase(index);
      db.updateHiveDatabase(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TO DO"),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addNewTask();
          },
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: db.task.length,
            itemBuilder: (context, index) {
              return ToDoTiles(
                task: db.task[index][0],
                value: db.task[index][1],
                onChanged: (value) {
                  checkbox(value, index);
                },
                onPressed: (context) {
                  deleteTask(index);
                },
              );
            },
          ),
        ));
  }
}
