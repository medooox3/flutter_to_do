import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> _todoItems = [];
  void _addTodoItem(String task) {
    setState(() {
      if (task.length > 0) {
        _todoItems.add(task);
      }
    });
  }

  Widget _buildTodoList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index], index);
        }
      },
    );
  }

  Widget _buildTodoItem(String todoText, int index) {
    return new ListTile(
      title: Text(todoText),
      onTap: () => _promptRemoveTodoItem(index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List App"),
      ),
      body: _buildTodoList(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add task',
        child: Icon(Icons.add),
        onPressed: _pushAddTodoScreen,
      ),
    );
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Add a new Task"),
            ),
            body: TextField(
              autofocus: true,
              onSubmitted: (val) {
                _addTodoItem(val);
                Navigator.pop(context); // close addTodoScreen
              },
              decoration: InputDecoration(
                  hintText: 'Enter something to do ...',
                  contentPadding: EdgeInsets.all(16.0)),
            ),
          );
        },
      ),
    );
  }

  void _removeTodoItem(int index){
    setState(() {
     _todoItems.removeAt(index); 
    });
  }

  void _promptRemoveTodoItem(int index){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Mark ${_todoItems[index]} as done ?"),
          actions: <Widget>[
            FlatButton(
              child: Text('cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("Mark as Done"),
              onPressed: (){
                _removeTodoItem(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }
}
