import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListviewDemo extends StatefulWidget {
  const ListviewDemo({Key? key}) : super(key: key);

  @override
  State<ListviewDemo> createState() => _ListviewDemoState();
}

class _ListviewDemoState extends State<ListviewDemo> {
  List<int> list = [];
  late ScrollController _controller;
  bool show = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset >= 100 && show == false) {
        setState(() {
          show = true;
        });
      } else if (_controller.offset < 100 && show == true) {
        setState(() {
          show = false;
        });
      }
    });
    for (var i = 0; i < 100; i++) {
      list.add(i);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滾動列表"),
        centerTitle: true,
      ),
      // body: Scrollbar(
      // child: RefreshIndicator(
      //   child: ListView(
      //     children: list.map((e) => Text(e.toString())).toList(),
      //     // shrinkWrap: true,
      //     // reverse: true,
      //     // itemExtent: 50,
      //   ),
      //   onRefresh: _onRefresh,
      // ),
      // ),
      floatingActionButton: show
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                _controller.animateTo(0,
                    duration: Duration(microseconds: 300), curve: Curves.ease);
              },
            )
          : null,
      body: ListView.builder(
        // scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext bonctext, int index) {
          // if (index == 2) {
          //   return Icon(Icons.add);
          // } else {
          return Text(list[index].toString());
          // }
        },
        itemCount: list.length,
        controller: _controller,
      ),
    );
  }

  Future _onRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      return "";
    });
  }
}
