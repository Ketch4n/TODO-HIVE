// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTiles extends StatelessWidget {
  final String task;
  final bool value;
  Function(bool?)? onChanged;
  Function(BuildContext)? onPressed;

  ToDoTiles({
    super.key,
    required this.task,
    required this.value,
    required this.onChanged,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: onPressed,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
        ],
      ),
      child: Card(
        child: Row(
          children: [
            Checkbox(
              value: value,
              onChanged: onChanged,
              checkColor: Colors.black,
            ),
            Text(task),
          ],
        ),
      ),
    );
  }
}
