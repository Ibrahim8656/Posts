import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/Core/Errors/failures.dart';
import 'package:flutter_application_1/features/posts/domain/entities/posts.dart';
import 'package:flutter_application_1/features/posts/domain/repositoris/posts_repository.dart';

class GetAllPostsUsecase {
  final PostsRepository postsRepository;

  GetAllPostsUsecase(this.postsRepository);
  Future<Either<Failuers,List<Post>>> call()async{
 return await postsRepository.getAllposts();
  }

}