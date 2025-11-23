import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialmedia/providers/auth_provider.dart';
import 'package:socialmedia/providers/post_provider.dart';
import 'package:socialmedia/screens/post_screen.dart';

class CreatePost extends StatelessWidget {
  CreatePost({super.key});
  
  final formKey = GlobalKey<FormState>();
  final postContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
// final userId = context.read<AuthProvider>().user!.users!.id;
final auth = Provider.of<AuthProvider>(context,listen: false);

    final postProv = Provider.of<PostProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text("Write Your Post"),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Post can't be empty";
                      }
                      return null;
                    },
                    controller: postContentController,
                    maxLines: 5,
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      int? userId = auth.user?.users?.id;
                      if (userId == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("User not found. Please login again.")),
                        );
                        return;
                      }
                      await postProv.createPost(
                        userId: userId,
                        content: postContentController.text
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen()));
                    }
                  },
                  child: Text("Post"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
