import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../modules/post_article/model/post_article_model.dart';

final _connect = Get.find<GetConnect>();

class PostArticleService {
  Future postArticle({required String title, required String desc}) async {
    final request = await _connect.post(
        'posts', PostArticleModelRequest(title: title, body: desc, userId: 1.toString()).toJson());
    if (!request.hasError) {
      return request.body!;
    } else {
      Logger().d(request.body.toString());
    }
  }
}
