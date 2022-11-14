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
              .pushNamed("menu", arguments: "菜單")
              .then((value) => print(value));
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
    dynamic arguments = ModalRoute.of(context)?.settings.arguments;
    print(arguments);
    return Scaffold(
      appBar: AppBar(
        title: Text("菜單 " + arguments.toString()),
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
