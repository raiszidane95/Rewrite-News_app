import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../data/Services/post_article_service.dart';

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
    try {
      final request = await PostArticleService()
          .postArticle(title: controllerTitle.text, desc: controllerDesc.text);
      Logger().d(request);
      isLoading.toggle();
      Get.back();
    } catch (error) {
      print(error);
      isLoading.toggle();
    }
  }
}
