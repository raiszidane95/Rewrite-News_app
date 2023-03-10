import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

import '../controllers/detail_article_controller.dart';

class DetailArticleView extends GetView<DetailArticleController> {
  const DetailArticleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: const Text('Star News'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
          color: Color(0xFFE9E6FF),
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Obx(() => controller.isLoading.value
                ? SkeletonParagraph()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.detailArticle.value.title ?? '',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade700),
                      ),
                      Gap(15),
                      Text(
                        controller.detailArticle.value.body ?? '',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black87),
                      ),
                    ],
                  )),
          ),
        ),
      ),
    );
  }
}
