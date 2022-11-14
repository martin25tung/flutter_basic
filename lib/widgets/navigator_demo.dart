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
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return MenuPage(); // 跳轉到菜單
            },
            maintainState: false, // 是否釋放資源
            settings: RouteSettings(name: "menu", arguments: ""), //設置路由訊息，是不是首頁
            fullscreenDialog: false, // 變成全螢幕Dialog
          ));
        },
        child: Text("登入"),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("菜單"),
        centerTitle: true,
      ),
    );
  }
}
