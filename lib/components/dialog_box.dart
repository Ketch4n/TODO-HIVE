// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_hive/components/buttons.dart';
import 'package:todo_hive/components/textfield.dart';

class DialogBox extends StatelessWidget {
  DialogBox(
      {super.key,
      required this.save,
      required this.cancel,
      required this.controller});
  TextEditingController controller;
  VoidCallback save;
  VoidCallback cancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        // constraints: BoxConstraints(maxWidth: 500),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        height: 115,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFieldWidget(
              controller: controller,
              hintText: "Input New Task...",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: cancel,
                  child: const Text("Cancel"),
                ),
                const SizedBox(
                  width: 8,
                ),
                ButtonsWidget(
                  color: Theme.of(context).primaryColor,
                  child: "Add new",
                  callback: save,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
