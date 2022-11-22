import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DebugDemo extends StatefulWidget {
  const DebugDemo({Key? key}) : super(key: key);

  @override
  State<DebugDemo> createState() => _DebugDemoState();
}

class _DebugDemoState extends State<DebugDemo> {
  int count = 10;
  String test = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("調試"),
      ),
      body: Text(count.toString()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            count++;
            if (count == 15) {
              test = "王" * 80000;
              print(test);
            }
          });
        },
      ),
    );
  }
}
