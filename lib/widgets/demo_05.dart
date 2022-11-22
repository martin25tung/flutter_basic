import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo05 extends StatefulWidget {
  const Demo05({Key? key}) : super(key: key);

  @override
  State<Demo05> createState() => _Demo05State();
}

class _Demo05State extends State<Demo05> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("性能優化"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.red,
          ),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.yellow,
            child: CountDemo(),
          ),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class CountDemo extends StatefulWidget {
  const CountDemo({Key? key}) : super(key: key);

  @override
  State<CountDemo> createState() => _CountDemoState();
}

class _CountDemoState extends State<CountDemo> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(count.toString()),
      onTap: () {
        setState(() {
          count++;
        });
      },
    );
  }
}
