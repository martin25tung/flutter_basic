import 'package:flutter/material.dart';
import 'package:flutter_basic/widgets/bottom_navigator.dart';
import 'package:flutter_basic/widgets/demo_01.dart';
import 'package:flutter_basic/widgets/demo_04.dart';
import 'package:flutter_basic/widgets/grid_view_demo.dart';
import 'package:flutter_basic/widgets/layout_demo.dart';
import 'package:flutter_basic/widgets/listview_demo.dart';
import 'package:flutter_basic/widgets/navigator_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => LoginPage(),
        "layout": (context) => LayoutDemo(),
        // "menu": (context) => MenuPage()
        "page": (context) => PageDemo(),
        "navigator": (context) => BottomNavigatorBarDemo(),
        "listview": (context) => ListviewDemo(),
        "grid": (context) => GridViewDemo(),
      },
      initialRoute: "grid",
      onGenerateRoute: (s) {
        // 可以在這裡做未登入檢查
        switch (s.name) {
          case "menu":
            return MaterialPageRoute(
                builder: (context) {
                  return MenuPage();
                },
                settings: s);
            break;
          default:
        }
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MartinTung"),
          elevation: 10,
          centerTitle: true,
        ),
        body: InputDemo());
  }
}

class CountPage extends StatefulWidget {
  const CountPage({Key? key}) : super(key: key);

  @override
  State<CountPage> createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$count"),
        ElevatedButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: Text("點擊"),
        ),
      ],
    );
  }
}
