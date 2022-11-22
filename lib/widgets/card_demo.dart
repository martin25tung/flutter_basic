import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardDemo extends StatefulWidget {
  const CardDemo({Key? key}) : super(key: key);

  @override
  State<CardDemo> createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  List<Map> list = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 10; i++) {
      list.add({"age": 10 + i, "name": "王$i"});
    }
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Card(
      shadowColor: Colors.red,
      elevation: 1,
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Text(list[index]["name"]),
          SizedBox(
            height: 8,
          ),
          Text(list[index]["age"].toString()),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("卡片視圖"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: _itemBuilder,
          itemCount: list.length,
        ),
      ),
    );
  }
}
