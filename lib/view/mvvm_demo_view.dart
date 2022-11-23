import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/view_model/mvvm_demo_view_model.dart';
import 'package:provider/provider.dart';

class MvvmDemoView extends StatefulWidget {
  const MvvmDemoView({Key? key}) : super(key: key);

  @override
  State<MvvmDemoView> createState() => _MvvmDemoViewState();
}

class _MvvmDemoViewState extends State<MvvmDemoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mvvm設計模式"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: Text("調用ViewModel"),
            onPressed: () async {
              context.read<MvvmDemoViewModel>().get("id");
            },
          ),
        ],
      ),
    );
  }
}
