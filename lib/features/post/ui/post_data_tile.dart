import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/post_models.dart';

class PostDataTileWidget extends StatelessWidget {
  final List<PostDataUiModel> posts;

  const PostDataTileWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(posts[index].userId.toString(), style: const TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.bold),),
                Text(posts[index].id.toString(), style: const TextStyle(fontFamily: 'Kanit'),),
                Text(posts[index].title, style: const TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.bold),),
                Text(posts[index].body, style: const TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.bold),),
              ],
            ),
          );
        });
  }
}
