import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageDemo extends StatefulWidget {
  List<Widget> widgets = [FlutterView(), AndroidView(), IosView()];

  @override
  State<PageDemo> createState() => _PageDemoState();
}

class _PageDemoState extends State<PageDemo>
    with SingleTickerProviderStateMixin {
  List tabs = ["Flutter", "Android", "iOS"];
  late TabController _controller;

  @override
  void initState() {
    _controller = new TabController(length: tabs.length, vsync: this);
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
        // leading: IconButton(
        //   icon: Icon(Icons.home),
        //   onPressed: () {
        //     print("leading");
        //   },
        // ),
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
      drawer: MyDrawer(),
      body: TabBarView(
        children: widget.widgets,
        controller: _controller,
      ),
    );
  }
}

class FlutterView extends StatelessWidget {
  const FlutterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Flutter"),
    );
  }
}

class AndroidView extends StatelessWidget {
  const AndroidView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Android"),
    );
  }
}

class IosView extends StatelessWidget {
  const IosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("iOS"),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text("data"),
            )
          ],
        ),
        removeTop: true,
      ),
    );
  }
}
