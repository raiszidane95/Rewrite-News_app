import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final int? id;
  HomeView({this.id});

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
      body: Obx(
        () => ListView.builder(
          itemCount: controller.listArticle.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.DETAIL_ARTICLE,
                    arguments: {'id': controller.listArticle[index].id.toString()});
                Logger().d(id);
              },
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
                color: Color(0xFFE9E6FF),
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.listArticle[index].title,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade700),
                      ),
                      Gap(15),
                      Text(
                        controller.listArticle[index].body,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black87),
                      ),
                      Gap(15),
                      IconButton(
                        onPressed: () => controller.deleteArticle(
                            id: controller.listArticle[index].id.toString()),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => Get.toNamed(Routes.POST_ARTICLE),
        child: Icon(
          Icons.add,
          color: Colors.green.shade700,
        ),
      ),
    );
  }
}
