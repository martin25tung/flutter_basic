import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageDemo extends StatefulWidget {
  const PageDemo({Key? key}) : super(key: key);

  @override
  State<PageDemo> createState() => _PageDemoState();
}

class _PageDemoState extends State<PageDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            print("leading");
          },
        ),
        title: Text("TabBar"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                print("add");
              },
              icon: Icon(Icons.add)),
          IconButton(
              onPressed: () {
                print("add");
              },
              icon: Icon(Icons.add)),
        ],
        elevation: 4.0,
      ),
    );
  }
}
