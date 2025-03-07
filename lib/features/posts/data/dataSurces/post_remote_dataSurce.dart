import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/Core/Errors/Exeptions.dart';
import 'package:flutter_application_1/features/posts/data/models/post_model.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDatasurce {
  Future<List<PostModel>> getAllposts();
  Future<Unit> deletePost(int postId);
  Future<Unit> updatepost(PostModel postModel);
  Future<Unit> addpost(PostModel postModel);
}

const BaseURL = "https://jsonplaceholder.typicode.com";

class PostRemoteDatasurceImpl implements PostRemoteDatasurce {
  final http.Client client;

  PostRemoteDatasurceImpl(this.client);
  @override
  Future<List<PostModel>> getAllposts() async {
    final response = await client.get(
      Uri.parse(BaseURL + "posts/"),
      headers: {"content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final List decodejson = json.decode(response.body) as List;
      List<PostModel> posts =
          decodejson.map((post) => PostModel.fromjson(post)).toList();
      return posts;
    } else {
      throw ServerExcption();
    }
  }

  @override
  Future<Unit> addpost(PostModel postModel) async {
    final body = {"title": postModel.title, "body": postModel.body};
    final response = await client.post(
      Uri.parse(BaseURL + "/posts/"),
      body: body,
    );
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerExcption();
    }
  }

  @override
  Future<Unit> deletePost(int postId) async {
    final response = await client.delete(
      Uri.parse(BaseURL + "/posts/${postId.toString()}"),
      headers: {"content-Type": "application/json"},
    );
          if(response.statusCode==200){
            return Future.value(unit);
          }else{
            throw ServerExcption();
          }
  }

  @override
  Future<Unit> updatepost(PostModel postModel)async {
    final postid=postModel.id;
    final body = {"title": postModel.title, "body": postModel.body};
    
  final response = await client.patch(
      Uri.parse(BaseURL + "/posts/${postid}"),body: body);
      if(response.statusCode==200){
        return Future.value(unit);
      }else{
        throw ServerExcption();
      }
  }
}
