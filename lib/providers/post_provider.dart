import 'package:flutter/material.dart';
import 'package:socialmedia/models/post_model.dart';
import 'package:socialmedia/services/post_service.dart';

class PostProvider extends ChangeNotifier
{
  PostModel?model;
  String? message;
   Future<void>getData()async
   {
       model = await PostService.getData();
       notifyListeners();
   }

    Future<void> deletePost({required int userId, required int postId}) async {
      message = await PostService.deletePost(userId: userId, postId: postId);
      await getData();
      notifyListeners();
    }

    Future<void> createPost({required int userId, required String content}) async {
      message = await PostService.createPost(userId: userId, content: content);
      await getData();
      notifyListeners();
    }
    
}