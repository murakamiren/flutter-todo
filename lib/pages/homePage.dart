import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_todo/pages/addTodoPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _todoItems = ["英語の課題", "牛乳を買う", "flutterを触る", "テスト"];

  void _addTodo(String title) {
    setState(() {
      _todoItems.add(title);
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
                title: Text(_todoItems[index]),
                trailing: IconButton(
                  icon: const Icon(Icons.more_vert_rounded),
                  onPressed: () {},
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
          if (title != null && title != "") _addTodo(title);
        },
        tooltip: "add todo",
        child: const Icon(Icons.add),
      ),
    );
  }
}
