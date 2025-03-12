part of 'add_delete_update_post_bloc.dart';

sealed class AddDeleteUpdatePostEvent extends Equatable {
  const AddDeleteUpdatePostEvent();

  @override
  List<Object> get props => [];
}
class AddPost extends AddDeleteUpdatePostEvent {
final Post post;
  const AddPost(this.post);
  @override
  List<Object> get props => [];
}
class DeletePost extends AddDeleteUpdatePostEvent{
  final int postid;

  const DeletePost({required this.postid});
  @override
  List<Object> get props => [];
}
class UpdatePost extends AddDeleteUpdatePostEvent{
  final Post post;

  const UpdatePost(this.post);
}