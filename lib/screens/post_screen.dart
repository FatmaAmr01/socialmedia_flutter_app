import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialmedia/providers/post_provider.dart';
import 'package:socialmedia/screens/create_post.dart';
import 'package:socialmedia/widgets/list_view_costm.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.teal,
    //     foregroundColor: Colors.white,
    //     title: Text("Homepage", style: TextStyle(fontWeight: FontWeight.bold)),
    //     centerTitle: true,
    //     leading: IconButton(
    //       icon: const Icon(Icons.add),
    //       onPressed: () {
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) => CreatePost()),
    //         );
    //       },
    //     ),
    //   ),

    //   body: Consumer<PostProvider>(
    //     builder: (context, value, child) {
    //       final postlist = value.model?.posts;
    //       if (postlist == null) {
    //         value.getData();
    //         return Center(child: CircularProgressIndicator());
    //       } 
    //       else if (postlist.isEmpty) {
    //         return Center(child: Text("No posts"));
    //       } else {
    //         return ListView.builder(
    //           itemCount: postlist.length,
    //           itemBuilder: (context, index) {
    //             return ListViewCostm(post: postlist[index]);
    //           },
    //         );
    //       }
    //     },
    //   ),
    // );


    var postProv = Provider.of<PostProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text(
          "Posts Feed"
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async{
              await postProv.getData();
            },
            icon: Icon(Icons.circle)
          )
        ],
      ),
      // Body
      body: SafeArea(
        child: Consumer<PostProvider>(
          builder: (context, postprovider, child) {
            var posts = postprovider.model?.posts;
            if (posts == null){
              postprovider.getData();
              return Center(child: CircularProgressIndicator(),);
            }
            else{
              return ListView.builder(
                itemCount: posts.length,
                reverse: true,
                itemBuilder: (context, index){
                  return ListViewCostm(post: posts[index]);
                }
              );
            }
          },
        )
      ),
      // Floating Button
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (con) => CreatePost())
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
