part of 'posts_bloc.dart';

sealed class PostsState extends Equatable {
  const PostsState();
  
  @override
  List<Object> get props => [];
}

final class PostsInitial extends PostsState {}
class LoadingPostsState extends PostsState{}
class LoadedPostsState extends PostsState{
  final List<Post>posts;

  const LoadedPostsState(this.posts);
   @override
  List<Object> get props => [posts];
}
class ErrorPostsState extends PostsState{
  final String errormessage;

  const ErrorPostsState(this.errormessage);
     @override
  List<Object> get props => [errormessage];
}