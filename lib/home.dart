import 'package:flutter/material.dart';
import 'package:my_app_shadid/dialog.dart';
import 'package:my_app_shadid/my_list.dart';
import 'package:my_app_shadid/todo.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> todos = [];

  _addTodo() async {
    final todo = await showDialog<Todo>(
      context: context,
      builder: (BuildContext context) {
        return NewTodoDialog();
      },
    );

    if (todo != null) {
      setState(() {
        todos.add(todo);
      });
    }
    // print(todos.length);
  }

  _toggleTodo(Todo todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }

  _removeTodo(Todo todo) {
    List<Todo> newTodos = [...todos];
    newTodos.removeWhere((item) => item.title == todo.title);
    setState(() {
      todos = newTodos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My List')),
      body: MyList(
        todos: todos,
        onTodoToggle: _toggleTodo,
        onRemoveTodo: _removeTodo,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addTodo,
      ),
    );
  }
}