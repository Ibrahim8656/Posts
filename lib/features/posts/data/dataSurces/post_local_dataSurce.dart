
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/Core/Errors/Exeptions.dart';
import 'package:flutter_application_1/features/posts/data/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
abstract class PostLocalDatasurce {
  Future<Unit> cachePosts(List<PostModel>postModel);
 Future<List<PostModel>> getcachedPosts();
 
}
class PostLocalDatasurceImpl implements PostLocalDatasurce{
  final SharedPreferences sharedPreferences;

  PostLocalDatasurceImpl(this.sharedPreferences);
  @override
  Future<Unit> cachePosts(List<PostModel> postModels) {
  List postModelTpjson=postModels.map((postmodel)=>postmodel.tojson()).toList();
   sharedPreferences.setString("CACHED_POSTS", json.encode(postModelTpjson));
   return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getcachedPosts() {
    final jsonString= sharedPreferences.getString("CACHED_POSTS");
    if(jsonString != null){
      List jsondecode=json.decode(jsonString);
      List<PostModel> cachePosts=jsondecode.map((post)=>PostModel.fromjson(post)).toList();
      return Future.value(cachePosts);
    }else{
      throw EmptyChacheExcption();
    }
  }


}