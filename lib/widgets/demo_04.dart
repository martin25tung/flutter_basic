import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageDemo extends StatefulWidget {
  const PageDemo({Key? key}) : super(key: key);

  @override
  State<PageDemo> createState() => _PageDemoState();
}

class _PageDemoState extends State<PageDemo>
    with SingleTickerProviderStateMixin {
  List tabs = ["Flutter", "Android", "iOS"];
  late TabController _controller;
  int _index = 0;

  @override
  void initState() {
    _controller = new TabController(
        initialIndex: _index, length: tabs.length, vsync: this);
    _controller.addListener(() {
      setState(() {
        _index = _controller.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        bottom: TabBar(
          controller: _controller,
          tabs: tabs
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
        ),
      ),
      body: Text(_index.toString()),
    );
  }
}
