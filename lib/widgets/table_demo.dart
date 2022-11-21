import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TableDemo extends StatefulWidget {
  const TableDemo({Key? key}) : super(key: key);

  @override
  State<TableDemo> createState() => _TableDemoState();
}

class _TableDemoState extends State<TableDemo> {
  List<Map> list = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 10; i++) {
      list.add({"name": "王" + i.toString(), "gender": i % 1 == 0 ? "男" : "女"});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("表格"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Table(
          border: TableBorder.all(color: Colors.grey),
          children: list
              .map((e) =>
                  TableRow(children: [Text(e["name"]), Text(e["gender"])]))
              .toList(),
        ),
      ),
    );
  }
}
