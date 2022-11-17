import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("佈局練習"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey,
        // child: Column(
        //   children: [
        //     Container(
        //       color: Colors.red,
        //       width: 100,
        //       height: 100,
        //     ),
        //     Container(
        //       color: Colors.green,
        //       width: 150,
        //       height: 100,
        //     ),
        //     Container(
        //       color: Colors.yellow,
        //       width: 100,
        //       height: 100,
        //     )
        //   ],
        // child: Row(
        //   // textDirection: TextDirection.rtl, // 左右
        //   mainAxisSize: MainAxisSize.max,
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   // crossAxisAlignment: CrossAxisAlignment.start, // 上下
        //   children: [
        //     Container(
        //       color: Colors.red,
        //       width: 100,
        //       height: 200,
        //     ),
        //     Container(
        //       color: Colors.green,
        //       width: 150,
        //       height: 100,
        //     ),
        //     Container(
        //       color: Colors.yellow,
        //       width: 100,
        //       height: 100,
        //     )
        //   ],
        // ),
        // child: Flex(
        //   direction: Axis.vertical,
        //   children: [
        //     Expanded(
        //       child: Container(
        //         color: Colors.red,
        //         width: 100,
        //         height: 200,
        //       ),
        //       flex: 1,
        //     ),
        //     Expanded(
        //       child: Container(
        //         color: Colors.green,
        //         width: 100,
        //         height: 100,
        //       ),
        //       flex: 2,
        //     ),
        //     Expanded(
        //       child: Container(
        //         color: Colors.yellow,
        //         width: 100,
        //         height: 100,
        //       ),
        //       flex: 1,
        //     )
        //   ],
        // ),
        child: StackDemo(),
      ),
    );
  }
}

class WrapDemo extends StatefulWidget {
  const WrapDemo({Key? key}) : super(key: key);

  @override
  State<WrapDemo> createState() => _WrapDemoState();
}

class _WrapDemoState extends State<WrapDemo> {
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
    return Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.spaceEvenly,
      spacing: 1.0,
      // 縱軸
      runSpacing: 1.0,
      //橫軸
      children: list
          .map((e) => Container(
                height: 100,
                width: 100,
                child: Text(e.toString()),
                color: Colors.blue,
              ))
          .toList(),
    );
  }
}

class StackDemo extends StatelessWidget {
  const StackDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          color: Colors.green,
          width: 100,
          height: 100,
        ),
        Container(
          color: Colors.red,
          width: 50,
          height: 20,
        ),
        Positioned(
          width: 20,
          height: 10,
          child: Container(
            color: Colors.yellow,
          ), // Positioned 包裹的東西，不受外在的參數影響
          // top: 10,
          // left: 10,
          // right: 10, // left and right 有值，不能設置width
          // bottom: 10, // 當top and bottom 有值，不能設置height
        )
      ],
    );
  }
}
