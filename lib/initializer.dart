import 'package:get/get.dart';

class Initializer {
  Future<void> init() async {
    _initializer();
  }
}

Future<void> _initializer() async {
  final connect = GetConnect();
  connect.baseUrl = 'https://jsonplaceholder.typicode.com/';
  Get.put(connect);
}
