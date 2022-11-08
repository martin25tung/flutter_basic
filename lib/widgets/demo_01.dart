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
