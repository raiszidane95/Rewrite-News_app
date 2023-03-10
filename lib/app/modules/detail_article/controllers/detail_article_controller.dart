import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../data/Services/detail_article_service.dart';
import '../model/detail_article_model.dart';

class DetailArticleController extends GetxController {
  RxBool isLoading = true.obs;
  String id = '';
  Rx<DetailArticlesModel> detailArticle = DetailArticlesModel().obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    id = args['id'];
    Logger().d(args);
    getDetailArticle();
  }

  getDetailArticle() async {
    isLoading.toggle();
    try {
      final response = await DetailArticleService().getDetailArticle(id: id);
      detailArticle(response);
      Logger().d(response);
    } catch (error) {
      Get.snackbar("Controller Error", error.toString());
      Logger().d(error.toString());
    }
  }
}
