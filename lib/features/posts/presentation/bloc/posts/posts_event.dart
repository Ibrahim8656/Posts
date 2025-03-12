part of 'posts_bloc.dart';

sealed class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
 
}
class GetAllpostsEvent extends PostsEvent{}
class RefreshPostsEvent extends PostsEvent{}