import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登入"),
        centerTitle: true,
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                builder: (context) {
                  return MenuPage(title: "菜單"); // 跳轉到菜單
                },
                maintainState: false, //  是否釋放資源
                settings: RouteSettings(
                    name: "menu", arguments: {"name": "123212"}), //設置路由訊息，是不是首頁
                fullscreenDialog: false, // 變成全螢幕Dialog
              ))
              .then((value) => print(value));
        },
        child: Text("登入"),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)?.settings.arguments;
    print(arguments);
    return Scaffold(
      appBar: AppBar(
        title: Text(title + " " + arguments.toString()),
        centerTitle: true,
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop({"name": "菜單返回"});
        },
        child: Text("返回"),
      ),
    );
  }
}
