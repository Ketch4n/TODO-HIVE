// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ButtonsWidget extends StatelessWidget {
  ButtonsWidget(
      {super.key,
      required this.color,
      required this.child,
      required this.callback});
  final Color color;

  final String child;
  VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      onPressed: () {
        callback();
      },
      child: Text(
        child,
      ),
    );
  }
}
