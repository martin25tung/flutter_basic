import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  const TextDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // 寬度最大
      color: Colors.green, // 背景顏色
      child: Text(
        "文本",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        // textDirection: TextDirection.rtl, // 從右到左
        textAlign: TextAlign.center, // 靠中間對齊
        style: TextStyle(color: Colors.white), // 文本樣式
      ),
    );
  }
}

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: null, child: Text("漂浮按鈕")),
        TextButton(
          onPressed: () {},
          child: Text("扁平按鈕"),
        ),
        TextButton.icon(
          onPressed: () {},
          label: Text(
            "data",
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.add),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
              foregroundColor: MaterialStateProperty.all(Colors.white)),
        ), // FlatButton 改成用TextButton
        OutlinedButton(
            onPressed: () {}, child: Text("OutlineButton")), // 有邊筐沒有陰影
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () {},
        )
      ],
    );
  }
}
