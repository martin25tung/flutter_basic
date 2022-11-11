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

class ImageIconDemo extends StatelessWidget {
  const ImageIconDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.add),
        IconButton(onPressed: () {}, icon: Icon(Icons.home)),
        Container(
          width: double.infinity,
          child: Image.network(
            "https://bkimg.cdn.bcebos.com/pic/0df3d7ca7bcb0a46c467b8316c63f6246b60af74?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg",
            fit: BoxFit.fill, // 填充
          ),
        ),
        Image.asset("images/image.jpeg"),
      ],
    );
  }
}

class CheckDemo extends StatefulWidget {
  const CheckDemo({Key? key}) : super(key: key);

  @override
  State<CheckDemo> createState() => _CheckDemoState();
}

class _CheckDemoState extends State<CheckDemo> {
  bool _check = false;
  bool _switch = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Checkbox(
            value: _check,
            onChanged: (v) {
              setState(() {
                _check = v!;
              });
            }),
        Switch(
            value: _switch,
            onChanged: (value) {
              _switch = value;
            })
      ],
    );
  }
}
