import 'package:flutter/material.dart';
import 'package:flutter_ders_3/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback handleTodoChange;
  final VoidCallback handleTdoDelete;

  const TodoItem({
    super.key,
    required this.todo,
    required this.handleTodoChange,
    required this.handleTdoDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        child: ListTile(
          onTap: () => handleTodoChange(),
          title: Text(
            todo.title,
            style: TextStyle(
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            ),
            onPressed: () {
              handleTodoChange();
            },
          ),
          trailing: IconButton(
            onPressed: () {
              handleTdoDelete();
            },
            icon: Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
