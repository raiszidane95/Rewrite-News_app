import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/post_article_controller.dart';

class PostArticleView extends GetView<PostArticleController> {
  const PostArticleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PostArticleView'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                'Judul',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const Gap(12),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller.controllerTitle,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  hintText: 'Title Here...',
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff535FF7), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0))),
            ),
            const Gap(24),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                'Deskripsi',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const Gap(12),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller.controllerDesc,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  hintText: 'Desc Here...',
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff535FF7), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0))),
            ),
            Gap(Get.height * 0.45),
            InkWell(
              onTap: () {
                controller.isLoading.value ? null : controller.onSubmit();
              },
              child: Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xFFFD9D9D9),
                ),
                child: Center(
                  child: controller.isLoading.value
                      ? CircularProgressIndicator()
                      : Text(
                          "Post",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
