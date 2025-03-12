part of 'add_delete_update_post_bloc.dart';

sealed class AddDeleteUpdatePostState extends Equatable {
  const AddDeleteUpdatePostState();
  
  @override
  List<Object> get props => [];
}

final class AddDeleteUpdatePostInitial extends AddDeleteUpdatePostState {}

final class AddDeleteUpdatePostLoading extends AddDeleteUpdatePostState {}

final class AddDeleteUpdatePostError extends AddDeleteUpdatePostState {
  final String errormessage;

  const AddDeleteUpdatePostError({required this.errormessage});
    @override
  List<Object> get props => [];
}
final class AddDeleteUpdatePostSuccess extends AddDeleteUpdatePostState {
  final String successmessage;

  const AddDeleteUpdatePostSuccess({required this.successmessage});
    @override
  List<Object> get props => [];
}
