import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../data/Services/delete_service.dart';
import '../../../data/Services/home_service.dart';
import '../model/list_articles_model.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<ListArticlesModel> listArticle = <ListArticlesModel>[].obs;

  void onInit() {
    super.onInit();
    getAllArticle();
  }

  Future<void> refreshListArticle() async {
    listArticle.clear();
    await getAllArticle();
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

  Future deleteArticle({required String id}) async {
    isLoading.toggle();
    try {
      final request = await DeleteArticleService().deleteArticle(id: id);
      Logger().d(request);
      await refreshListArticle();
    } catch (error) {
      isLoading.toggle();
      Get.snackbar("Controller error", error.toString());
      print(error);
    }
  }
}
