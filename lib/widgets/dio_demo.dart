import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DioDemo extends StatefulWidget {
  const DioDemo({Key? key}) : super(key: key);

  @override
  State<DioDemo> createState() => _DioDemoState();
}

class _DioDemoState extends State<DioDemo> {
  Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    _dio.options.baseUrl = "http://api.td0f7.cn:8083/";
    _dio.options.connectTimeout = 1000; // 超過時間就跳異常
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dio網路請求"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: _get, child: Text("Get")),
          ElevatedButton(onPressed: _post, child: Text("Post")),
          ElevatedButton(onPressed: _try, child: Text("異常捕捉"))
        ],
      ),
    );
  }

  void _get() async {
    var result = await _dio.get("dio/dio/test", queryParameters: {
      "id": "1",
    });
    print(result);
    var result1 = await _dio.get("dio/dio/test",
        queryParameters: {
          "id": "1",
        },
        options: Options(headers: {"token": "dasdfsdfa"}));
    print(result1);
  }

  void _post() async {
    var result = await _dio.post("dio/dio",
        queryParameters: {
          "id": "1",
        },
        options: Options(headers: {"token": "dfasdfa"}));
    print(result);
  }

  void _try() async {
    try {
      print("object");
      dynamic result = await _dio.get("/dio/dio/tim");
      print(result);
      throw "測試異常";
    } on DioError {
      print("DioError");
    } on String {
      print("String Error");
    } catch (e) {
      print(e.runtimeType);
    }
  }
}
