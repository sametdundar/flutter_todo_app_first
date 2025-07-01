import 'package:flutter/material.dart';
import 'package:flutter_ders_3/constants/colors.dart';
import 'package:flutter_ders_3/models/todo.dart';
import 'package:flutter_ders_3/widgets/todo_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Todo> todolist = Todo.todolist();

  _handleTodoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  _handleTodoDelete(Todo todo) {
    setState(() {
      todolist.remove(todo);
    });
  }

  _handleAddTodoItem(String title) {
    if (title.trim().isNotEmpty) {
      setState(() {
        todolist.add(
          Todo(id: DateTime.now().millisecond.toString(), title: title.trim()),
        );
      });
    }
    _controller.clear();
    FocusScope.of(context).unfocus();
  }

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        color: backgroundColor,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(20),
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      "All Todo's",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                        color: titleColor,
                        letterSpacing: -3,
                      ),
                    ),
                  ),
                  ...todolist.map(
                    (todo) => (TodoItem(
                      todo: todo,
                      handleTodoChange: () => _handleTodoChange(todo),
                      handleTdoDelete: () => _handleTodoDelete(todo),
                    )),
                  ),
                ],
              ),
            ),
            SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Add to new todo...",
                          prefixIcon: Icon(Icons.search),
                          prefixIconConstraints: BoxConstraints(
                            minHeight: 30,
                            minWidth: 45,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: border,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add, color: Colors.white),
                      onPressed: () => _handleAddTodoItem(_controller.text),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
