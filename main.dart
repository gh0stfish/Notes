// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:read/home.dart';


void main() {
  runApp(const Todo_list());
}
class Todo_list extends StatefulWidget {
  const Todo_list({super.key});

  @override
  State<Todo_list> createState() => _Todo_listState();
}

class _Todo_listState extends State<Todo_list> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: Typography.tall2021,
        platform: TargetPlatform.android,
      ),
      home: const Add(notes: [],),
    );
  }
}
