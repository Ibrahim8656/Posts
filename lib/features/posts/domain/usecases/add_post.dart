import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/Core/Errors/failures.dart';
import 'package:flutter_application_1/features/posts/domain/entities/posts.dart';
import 'package:flutter_application_1/features/posts/domain/repositoris/posts_repository.dart';

class AddPostUsecase{
  final PostsRepository postsRepository;

  AddPostUsecase(this.postsRepository);
    Future<Either<Failuers,Unit>>call({required Post post})async{
      return postsRepository.addPost(post);
    }
}