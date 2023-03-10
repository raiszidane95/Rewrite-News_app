import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../data/Services/home_service.dart';
import '../model/list_articles_model.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<ListArticlesModel> listArticle = <ListArticlesModel>[].obs;

  void onInit() {
    super.onInit();
    getAllArticle();
  }

  getAllArticle() async {
    isLoading(true);
    try {
      final response = await GetAllArticle().getAllArticle();
      Logger().d(response);
      listArticle.value = response;
      isLoading.toggle();
    } catch (error) {
      isLoading.toggle();
      Get.snackbar("Controler Error", error.toString());
      Logger().d(error);
    }
  }
}
