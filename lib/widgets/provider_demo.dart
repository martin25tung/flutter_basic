import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/CountProvider.dart';

class ProviderDemo extends StatefulWidget {
  const ProviderDemo({Key? key}) : super(key: key);

  @override
  State<ProviderDemo> createState() => _ProviderDemoState();
}

class _ProviderDemoState extends State<ProviderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider全局狀態管理"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(Provider.of<CountProvider>(context).count.toString()),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("provider2");
              },
              child: Text("跳轉"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            context.read<CountProvider>().add();
          }),
    );
  }
}

class ProviderDemoTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read<CountProvider>().add();
        },
      ),
    );
  }
}
