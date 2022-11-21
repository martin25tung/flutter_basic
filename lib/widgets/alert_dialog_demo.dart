import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogDemoState extends StatefulWidget {
  const AlertDialogDemoState({Key? key}) : super(key: key);

  @override
  State<AlertDialogDemoState> createState() => _AlertDialogDemoStateState();
}

class _AlertDialogDemoStateState extends State<AlertDialogDemoState> {
  List<int> list = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 20; i++) {
      list.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog Demo"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: _showAlert, child: Text("對話筐")),
          ElevatedButton(onPressed: _showListDialog, child: Text("列表對話筐"))
        ],
      ),
    );
  }

  void _showListDialog() async {
    var result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            // CupertinoAlertDialog ios樣式
            title: Text("標題"),
            children: list
                .map((e) => GestureDetector(
                      child: Text(e.toString()),
                      onTap: () {
                        Navigator.pop(context, e);
                      },
                    ))
                .toList(),
          );
        });
    print(result);
  }

  void _showAlert() async {
    var result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // CupertinoAlertDialog ios樣式
            title: Text("標題"),
            content: Text("確認刪除嗎？"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text("取消"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text("確認"),
              ),
            ],
          );
        });
    print(result);
  }
}
