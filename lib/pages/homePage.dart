import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_todo/pages/addTodoPage.dart';

class TodoClass {
  String title;
  IconData icon;

  TodoClass(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TodoClass> _todoItems = [
    TodoClass("テストです", Icons.note_rounded),
    TodoClass("flutterなう", Icons.now_wallpaper)
  ];

  // add todo function
  void _addTodo(TodoClass todo) {
    setState(() {
      _todoItems.add(todo);
    });
  }

  // del todo function
  void _deleteTodo(int index) {
    setState(() {
      _todoItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello flutter"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: _todoItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: Card(
              child: ListTile(
                leading: Icon(
                  _todoItems[index].icon,
                  size: 30,
                  color: Colors.cyan,
                ),
                title: Text(_todoItems[index].title),
                trailing: IconButton(
                  icon: const Icon(Icons.more_vert_rounded),
                  onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text(_todoItems[index].title),
                            actions: [
                              IconButton(
                                onPressed: () {
                                  _deleteTodo(index);
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.delete),
                                color: Colors.deepOrange,
                              )
                            ],
                          )),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String? title = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddTodoPage()));
          if (title != null && title != "")
            _addTodo(TodoClass(title, Icons.add));
        },
        tooltip: "add todo",
        child: const Icon(Icons.add),
      ),
    );
  }
}
