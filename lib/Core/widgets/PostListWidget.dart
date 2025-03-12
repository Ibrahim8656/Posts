import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/posts/domain/entities/posts.dart';

class Postlistwidget extends StatelessWidget {
  final List<Post>posts;
  const Postlistwidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context,index){
      return ListTile(
        leading:Text(posts[index].id.toString()),
        title: Text(posts[index].title,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        subtitle:  Text(posts[index].body),
        contentPadding: EdgeInsets.symmetric(horizontal:10 ),
        onTap: (){

        },
        );
    },
     separatorBuilder: (context,index){
        return Divider(
          thickness: 1,
        );
    }, itemCount: posts.length);
  }
}