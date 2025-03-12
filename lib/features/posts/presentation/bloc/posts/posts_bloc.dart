import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/Core/Errors/errormessages.dart';
import 'package:flutter_application_1/features/posts/domain/entities/posts.dart';
import 'package:flutter_application_1/features/posts/domain/usecases/get_all_posts.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final  GetAllPostsUsecase getAllPosts;

  PostsBloc(this.getAllPosts) : super(PostsInitial()) {

      
    on<PostsEvent>((event, emit)async {
      
     if(event is GetAllpostsEvent){
      emit(LoadingPostsState());
      print("HHHHHHHHHHHHHHHHHHHHHH");
      final posts= await getAllPosts.call();
      posts.fold(
        (ifleft){
       
         emit(ErrorPostsState(errormessage(ifleft)));
        }, 
        (ifRight){
          emit(LoadedPostsState(ifRight));
        }
        );
     }else if(event is RefreshPostsEvent){
       emit(LoadingPostsState());
      final posts= await getAllPosts.call();
      posts.fold(
        (ifleft){
         emit(ErrorPostsState(errormessage(ifleft)));
        }, 
        (ifRight){
          emit(LoadedPostsState(ifRight));
        }
        );
     }
    });
  }
}
