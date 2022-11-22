import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TableDemo extends StatefulWidget {
  const TableDemo({Key? key}) : super(key: key);

  @override
  State<TableDemo> createState() => _TableDemoState();
}

class _TableDemoState extends State<TableDemo> {
  List<Map> list = [];
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  void initState() {
    super.initState();
    for (var i = 1; i < 10; i++) {
      list.add({
        "name": "王" * i,
        "gender": i % 1 == 0 ? "男" : "女",
        "select": false,
        "age": i
      });
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
          // child: Table(
          //   border: TableBorder.all(color: Colors.grey),
          //   children: list
          //       .map((e) =>
          //           TableRow(children: [Text(e["name"]), Text(e["gender"])]))
          //       .toList(),
          // ),
          child: DataTable(
            // onSelectAll: (v) {
            //   for (var i = 0; i < list.length; i++) {
            //     setState(() {
            //       if (list[i]["select"] != v) {
            //         list[i]["select"] = v;
            //       }
            //     });
            //   }
            // }, // 自己實現select all 的功能，不推薦使用
            sortColumnIndex: _sortColumnIndex,
            sortAscending: _sortAscending,
            columns: [
              DataColumn(
                  label: Text("姓名"),
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      // 對名字做排序
                      _sortColumnIndex = columnIndex;
                      _sortAscending = ascending;
                      list.sort((a, b) {
                        if (!ascending) {
                          var c = a;
                          a = b;
                          b = c;
                        }
                        return a["name"]
                            .toString()
                            .length
                            .compareTo(b["name"].toString().length);
                      });
                    });
                  }),
              DataColumn(
                  label: Text("年齡"),
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      // 對年齡做排序
                      _sortColumnIndex = columnIndex;
                      _sortAscending = ascending;
                      list.sort((a, b) {
                        if (!ascending) {
                          var c = a;
                          a = b;
                          b = c;
                        }
                        return a["age"].compareTo(b["age"]);
                      });
                    });
                  }),
              DataColumn(label: Text("性別")),
            ],
            rows: list
                .map((e) => DataRow(
                        selected: e["select"],
                        onSelectChanged: (v) {
                          setState(() {
                            if (e["select"] != v) {
                              e["select"] = v;
                            }
                          });
                        },
                        cells: [
                          DataCell(Text(e["name"])),
                          DataCell(Text(e["age"].toString())),
                          DataCell(Text(e["gender"]))
                        ]))
                .toList(),
          )),
    );
  }
}
