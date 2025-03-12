import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/Core/Errors/Exeptions.dart';
import 'package:flutter_application_1/Core/Errors/failures.dart';
import 'package:flutter_application_1/Core/Network/network_info.dart';
import 'package:flutter_application_1/features/posts/data/dataSurces/post_local_dataSurce.dart';
import 'package:flutter_application_1/features/posts/data/dataSurces/post_remote_dataSurce.dart';
import 'package:flutter_application_1/features/posts/data/models/post_model.dart';
import 'package:flutter_application_1/features/posts/domain/entities/posts.dart';
import 'package:flutter_application_1/features/posts/domain/repositoris/posts_repository.dart';

//here we should talk with local or rmote data surcess
class PostRepositoryImpl extends PostsRepository {
  final PostRemoteDataSource postRemoteDatasurce;
  final PostLocalDatasurce postLocalDatasurce;
  final NetworkInfo networkInfo;
  PostRepositoryImpl(
    this.postRemoteDatasurce,
    this.postLocalDatasurce,
    this.networkInfo,
  );
  @override
  Future<Either<Failuers, List<Post>>> getAllposts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteposts = await postRemoteDatasurce.getAllPosts();
        postLocalDatasurce.cachePosts(remoteposts);
        return right(remoteposts);
      } on ServerExcption {
        return left(ServerFailuer());
      }
    } else {
      try {
        final localPosts = await postLocalDatasurce.getcachedPosts();
        return right(localPosts);
      } on EmptyChacheExcption {
        return left(EmptyChacheFailuer());
      }
    }
  }

  @override
  Future<Either<Failuers, Unit>> addPost(Post post) async{
    PostModel postModel =PostModel(post.id, post.title, post.body);
        
   return await _Getmessage((){
    return postRemoteDatasurce.addPost(postModel);
   },);
  }

  @override
  Future<Either<Failuers, Unit>> deletePost(int id) async{
     
   return await _Getmessage((){
    return postRemoteDatasurce.deletePost(id);
   },);
  }

  @override
  Future<Either<Failuers, Unit>> updatePost(Post post) async{
    PostModel postModel = PostModel(post.id, post.title, post.body);
   return await _Getmessage((){
    return postRemoteDatasurce.updatePost(postModel);
   },);
  }
  Future<Either<Failuers, Unit>> _Getmessage(Future<Unit> Function()addddeleteandupdate)async{
    if(await networkInfo.isConnected){
      try{
         addddeleteandupdate;
        return right(unit);
      }on ServerExcption{    
        return left(ServerFailuer());
      }
    }else{
      return left(OflineFailuer());
    }
  }
}
