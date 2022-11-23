import 'package:flutter/cupertino.dart';
import 'package:flutter_basic/model/mvvm_demo_model.dart';

class MvvmDemoViewModel extends ChangeNotifier {
  MvvmDemoModel _model = MvvmDemoModel();

  void get(String id) async {
    var result = await _model.get(id);
    print(result);
  }
}
