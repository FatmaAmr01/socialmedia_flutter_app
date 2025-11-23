import 'package:dio/dio.dart';
import 'package:socialmedia/models/post_model.dart';

class PostService {
  static Dio dio = Dio();
  static Future<PostModel> getData() async {
    try {
      Response response = await dio.get(
        "https://socialmediaapi.runasp.net/api/Post",
      );
      return PostModel.fromjson(json: response.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (c) {
      throw Exception(c);
    }
  }

  static Future<String> createPost({
    required int userId,
    required String content,
  }) async {
    try {
      // ignore: unused_local_variable
      Response response = await dio.post(
        "https://socialmediaapi.runasp.net/api/Post",
        data: {"userId": userId, "content": content},
      );
      return response.data['message'];
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (c) {
      throw Exception(c);
    }
  }

  static Future<String> deletePost({
    required int userId,
    required int postId,
  }) async {
    try {
      // ignore: unused_local_variable
      Response response = await dio.delete(
        "https://socialmediaapi.runasp.net/api/Post/$postId/User/$userId",
        data: {"userId": userId, "postId": postId},
      );
      return response.data['message'];
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (c) {
      throw Exception(c);
    }
  }
}
