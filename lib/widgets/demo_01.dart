import 'package:flutter/cupertino.dart';
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

class ProgressDemo extends StatelessWidget {
  const ProgressDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          LinearProgressIndicator(
            value: .5,
            valueColor: AlwaysStoppedAnimation(Colors.yellow),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.red),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          CupertinoActivityIndicator()
        ],
      ),
    );
  }
}

class ClickDemo extends StatelessWidget {
  const ClickDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("tag");
      },
      onDoubleTap: () {
        print("double tag");
      },
      child: Text("data"),
    );
  }
}

class InputDemo extends StatefulWidget {
  const InputDemo({Key? key}) : super(key: key);

  @override
  State<InputDemo> createState() => _InputDemoState();
}

class _InputDemoState extends State<InputDemo> {
  GlobalKey _key = GlobalKey<FormState>();
  TextEditingController _user = TextEditingController();
  TextEditingController _pass = TextEditingController();
  FocusNode _u = FocusNode();
  FocusNode _p = FocusNode();
  late FocusScopeNode _focusScopeNode;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _user.dispose();
    _pass.dispose();
    _u.dispose();
    _p.dispose();
    _focusScopeNode?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            focusNode: _u,
            controller: _user,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.add),
                labelText: "帳號",
                hintText: "請輸入帳號"),
            validator: (v) {
              if (v == null || v.isEmpty) {
                return "帳號必須輸入！";
              }
            },
            // 校驗
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (v) {
              print("object");
            },
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            focusNode: _p,
            controller: _user,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.add),
                labelText: "密碼",
                hintText: "請輸入密碼"),
            obscureText: true,
            // 密碼
            validator: (v) {
              if (v == null || v.length < 5) {
                return "密碼必須輸入且長度大於五";
              }
            },
            // textInputAction: TextInputAction.search, // 搜索
            textInputAction: TextInputAction.send,
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () {
              if (_focusScopeNode == null) {
                _focusScopeNode = FocusScope.of(context);
              }
              _focusScopeNode.requestFocus(_u);
              _focusScopeNode.unfocus();
              print((_key.currentState as FormState).validate().toString());
            },
            child: Text("提交"),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black)),
          ),
        ],
      ),
    );
  }
}
