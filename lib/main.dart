import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_hive/pages/homepage.dart';
import 'package:todo_hive/settings/theme.dart';

void main() async {
  // initialize hive flutter
  await Hive.initFlutter();
  // open box
  await Hive.openBox('initialBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightmode,
      // darkTheme: darkmode,
      home: const HomePage(),
    );
  }
}
