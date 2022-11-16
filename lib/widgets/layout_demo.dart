import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("佈局練習"),
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
        // ),
        child: Row(
          children: [
            Container(
              color: Colors.red,
              width: 100,
              height: 200,
            ),
            Container(
              color: Colors.green,
              width: 150,
              height: 100,
            ),
            Container(
              color: Colors.yellow,
              width: 100,
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
