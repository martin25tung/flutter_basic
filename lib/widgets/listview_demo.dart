import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListviewDemo extends StatefulWidget {
  const ListviewDemo({Key? key}) : super(key: key);

  @override
  State<ListviewDemo> createState() => _ListviewDemoState();
}

class _ListviewDemoState extends State<ListviewDemo> {
  List<int> list = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 100; i++) {
      list.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滾動列表"),
        centerTitle: true,
      ),
      body: Scrollbar(
        child: ListView(
          children: list.map((e) => Text(e.toString())).toList(),
        ),
      ),
    );
  }
}
