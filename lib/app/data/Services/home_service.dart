import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../modules/home/model/list_articles_model.dart';

final _connect = Get.find<GetConnect>();

class GetAllArticle {
  Future<List<ListArticlesModel>> getAllArticle() async {
    final response = await _connect.get('posts',
        decoder: (data) =>
            List<ListArticlesModel>.from(data.map((x) => ListArticlesModel.fromJson(x))));
    if (!response.hasError) {
      // Logger().d(response.body);
      return response.body!;
    } else {
      Logger().d(response.statusCode);
      throw Get.snackbar("Service Error", response.statusCode.toString());
    }
  }
}
