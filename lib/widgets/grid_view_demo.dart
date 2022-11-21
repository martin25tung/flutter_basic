import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewDemo extends StatelessWidget {
  const GridViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("網格佈局"),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
        scrollDirection: Axis.vertical,
        // shrinkWrap: true, // 不可滑動
        children: [
          // Icon(Icons.add),
          // Icon(Icons.home),
          // Icon(Icons.clean_hands),
          // Icon(Icons.baby_changing_station),
          // Icon(Icons.dangerous),
          // Icon(Icons.g_translate),
          // Icon(Icons.dangerous),
          // Icon(Icons.g_translate),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
