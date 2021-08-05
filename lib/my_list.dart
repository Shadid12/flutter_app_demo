import 'package:flutter/material.dart';
import 'package:my_app_shadid/todo.dart';


class MyList extends StatelessWidget {
  MyList({Key? key, required this.todos, required this.onTodoToggle, required this.onRemoveTodo}) : super(key: key);

  List<Todo> todos;
  final onTodoToggle;
  final onRemoveTodo;

  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];

    TextStyle? _getTextStyle(bool done) {
    if (!done) return null;

      return const TextStyle(
        color: Colors.black54,
        decoration: TextDecoration.lineThrough,
      );
    }

    return CheckboxListTile(
      value: todo.isDone,
      title: Text(
        todo.title,
         style: _getTextStyle(todo.isDone)
      ),
      onChanged: (isChecked) {
        onTodoToggle(todo, isChecked);
      },
      secondary: ElevatedButton(
        onPressed: () {
          onRemoveTodo(todo);
        },
        child: Icon(Icons.delete),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildItem,
      itemCount: todos.length,
    );
  }
}