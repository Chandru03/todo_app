import 'package:flutter/material.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> todos = [];
  TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do App - (715521104303)'),
        backgroundColor: Colors.amber,
        titleTextStyle: TextStyle(
          color: Colors.black54,
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  todos.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        tooltip: 'add a new task',
        onPressed: () {
          showAddTodoDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void showAddTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add a New Task'),
          content: TextField(
            controller: todoController,
            decoration: InputDecoration(
              hintText: 'Enter your task',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  String newTodo = todoController.text;
                  if (newTodo.isNotEmpty) {
                    todos.add(newTodo);
                    todoController.clear();
                  }
                  Navigator.of(context).pop();
                });
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
