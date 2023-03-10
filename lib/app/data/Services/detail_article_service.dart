import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../modules/detail_article/model/detail_article_model.dart';

final _connect = Get.find<GetConnect>();

class DetailArticleService {
  Future getDetailArticle({required String id}) async {
    final response = await _connect.get(
      'posts/$id',
      decoder: (data) => DetailArticlesModel.fromJson(data),
    );

    if (!response.hasError) {
      return response.body!;
    } else {
      Get.snackbar('Service Error', response.statusText.toString());
      Logger().d(response.statusCode.toString());
    }
  }
}
