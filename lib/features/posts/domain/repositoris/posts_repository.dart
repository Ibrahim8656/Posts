import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/Core/Errors/failures.dart';
import 'package:flutter_application_1/features/posts/domain/entities/posts.dart';

abstract class PostsRepository {
  Future<Either<Failuers,List<Post>>>getAllposts();
  Future<Either<Failuers,Unit>>deletePost(int id);
  Future<Either<Failuers,Unit>>updatePost(Post post);
  Future<Either<Failuers,Unit>>addPost(Post post);
}
