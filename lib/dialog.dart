import 'package:flutter/material.dart';
import 'package:my_app_shadid/todo.dart';

class NewTodoDialog extends StatelessWidget {
  final controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New todo'),
      content: TextField(
        controller: controller,
        autofocus: true,
      ),
      actions: <Widget>[
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text('Add'),
          onPressed: () {
            final todo = new Todo(title: controller.value.text);
            controller.clear();
            Navigator.of(context).pop(todo); // unmount this
          },
        ),
      ],
    );
  }
}
