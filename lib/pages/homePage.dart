import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text("sample"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("sample"),
            ),
          )
        ],
      ),
    );
  }
}
