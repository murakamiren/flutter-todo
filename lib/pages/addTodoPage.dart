import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:flutter_todo/pages/homePage.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  // input value
  String _title = "";

  // icon picker
  IconData? _icon;

  // icon pick function
  void _pickIcon() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(context);
    setState(() {
      _icon = icon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("add todo")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("タスクを入力してください"),
            TextField(
              onChanged: (String text) => _title = text,
            ),
            _icon == null
                ? const Text("アイコンを選択してください")
                : Icon(
                    _icon,
                    size: 40,
                  ),
            ElevatedButton(
              onPressed: () => _pickIcon(),
              child: const Text("アイコン選択"),
            ),
            ElevatedButton(
                onPressed: () => {
                      if (_icon != null && _title != "")
                        {
                          Navigator.pop(context, TodoClass(_title, _icon!)),
                        }
                    },
                child: const Text("追加する"))
          ],
        ),
      ),
    );
  }
}
