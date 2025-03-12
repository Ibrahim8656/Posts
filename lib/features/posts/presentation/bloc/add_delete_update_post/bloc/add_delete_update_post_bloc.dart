import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/Core/Errors/errormessages.dart';
import 'package:flutter_application_1/Core/strings/successmessages.dart';
import 'package:flutter_application_1/features/posts/domain/entities/posts.dart';
import 'package:flutter_application_1/features/posts/domain/usecases/add_post.dart';
import 'package:flutter_application_1/features/posts/domain/usecases/delete_post.dart';
import 'package:flutter_application_1/features/posts/domain/usecases/update_post.dart';

part 'add_delete_update_post_event.dart';
part 'add_delete_update_post_state.dart';

class AddDeleteUpdatePostBloc extends Bloc<AddDeleteUpdatePostEvent, AddDeleteUpdatePostState> {
  final AddPostUsecase addpost;
  final UpdatePostUsecase updatePost;
  final DeletePostUsecase deletePost; 
  AddDeleteUpdatePostBloc(this.addpost, this.updatePost, this.deletePost) : super(AddDeleteUpdatePostInitial()){
    on<AddDeleteUpdatePostEvent>((event, emit) async{
      if(event is AddPost){
        emit (AddDeleteUpdatePostLoading());
        final FailuerOrMessage =await addpost.call(post: event.post);
        FailuerOrMessage.fold((failuer){
          emit(AddDeleteUpdatePostError(errormessage: errormessage(failuer)));
        },
         (_){
          emit(AddDeleteUpdatePostSuccess(successmessage:ADD_SUCCESS_MESSAGE ));
        });
      }else if(event is UpdatePost){
          emit (AddDeleteUpdatePostLoading());
        final FailuerOrMessage =await updatePost.call(post: event.post);
        FailuerOrMessage.fold((failuer){
          emit(AddDeleteUpdatePostError(errormessage: errormessage(failuer)));
        },
         (_){
          emit(AddDeleteUpdatePostSuccess(successmessage:UPDATE_SUCCESS_MESSAGE ));
        });
      }else if(event is DeletePost){
          emit (AddDeleteUpdatePostLoading());
        final FailuerOrMessage =await deletePost.call(postid: event.postid);
        FailuerOrMessage.fold((failuer){
          emit(AddDeleteUpdatePostError(errormessage: errormessage(failuer)));
        },
         (_){
          emit(AddDeleteUpdatePostSuccess(successmessage:DELETE_SUCCESS_MESSAGE ));
        });
      }
    });
  }
}
