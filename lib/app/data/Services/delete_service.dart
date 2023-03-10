import 'package:get/get.dart';
import 'package:logger/logger.dart';

final _connect = Get.find<GetConnect>();

class DeleteArticleService {
  Future deleteArticle({required String id}) async {
    final request = await _connect.get('posts/$id');
    if (!request.hasError) {
      return request.body!;
    } else {
      Get.snackbar('Service Error', request.statusText.toString());
      Logger().d(request.statusCode.toString());
    }
  }
}
