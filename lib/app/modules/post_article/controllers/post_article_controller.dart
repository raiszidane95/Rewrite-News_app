import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostArticleController extends GetxController {
  final controllerTitle = TextEditingController();
  final controllerDesc = TextEditingController();
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  onSubmit() async {
    isLoading.toggle();
    try {} catch (error) {}
  }
}
