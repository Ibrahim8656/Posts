import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/Core/Errors/failures.dart';
import 'package:flutter_application_1/features/posts/domain/repositoris/posts_repository.dart';

class DeletePostUsecase {
  final PostsRepository postsRepository;

  DeletePostUsecase(this.postsRepository);
    Future<Either<Failuers,Unit>>call(int postid)async{
   return postsRepository.deletePost(postid);
    }
}