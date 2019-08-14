import 'package:flutter/material.dart';
import './TodoList.dart';

main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List App',
      home: TodoList(),
    );
  }
}
