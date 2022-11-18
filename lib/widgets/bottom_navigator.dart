import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'demo_04.dart';
import 'layout_demo.dart';

class BottomNavigatorBarDemo extends StatefulWidget {
  List<Widget> widgets = [PageDemo(), LayoutDemo()];

  @override
  State<BottomNavigatorBarDemo> createState() => _BottomNavigatorBarDemoState();
}

class _BottomNavigatorBarDemoState extends State<BottomNavigatorBarDemo> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("底部選項卡"),
      //   centerTitle: true,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 超過3個，就需要用這個參數
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "新增"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "我的"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "新增"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "我的")
        ],
        currentIndex: _index,
        onTap: (v) {
          setState(() {
            _index = v;
          });
        },
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: Theme.of(context).primaryColor,
      //   shape: CircularNotchedRectangle(),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       IconButton(onPressed: () {}, icon: Icon(Icons.add)),
      //       SizedBox(),
      //       IconButton(onPressed: () {}, icon: Icon(Icons.home)),
      //     ],
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("object");
        },
        child: Icon(Icons.widgets_rounded),
      ),
      body: widget.widgets[_index],
    );
  }
}
