import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialmedia/models/post_model.dart';
import 'package:socialmedia/providers/auth_provider.dart';
import 'package:socialmedia/providers/post_provider.dart';

class ListViewCostm extends StatelessWidget {
  final Post post;
  ListViewCostm({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    var postProv = Provider.of<PostProvider>(context);
    var authProv = Provider.of<AuthProvider>(context, listen: false);

    return Card(
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(child: Text(post.userName[0].toUpperCase())),
        title: Text(post.createdAt),
        subtitle: Text(post.content),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,

          children: [
            IconButton(
              onPressed: () async {
                await postProv.deletePost(
                  userId: authProv.user!.users!.id!,
                  postId: post.id,
                );
                if (postProv.message == "Post deleted successfully") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(postProv.message ?? ""),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(postProv.message ?? ""),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
