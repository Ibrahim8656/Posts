import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/widgets/ErrorWidget.dart';
import 'package:flutter_application_1/Core/widgets/PostListWidget.dart';
import 'package:flutter_application_1/Core/widgets/loadingWidget.dart';
import 'package:flutter_application_1/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:flutter_application_1/features/posts/presentation/screens/add_update_post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title: Center(child: Text("posts")),
      ) ,
      body:_bildBody(context),
      floatingActionButton: _floatingActionButton(context),
    );
  }
}
Widget _bildBody(BuildContext context){
  return Padding(padding: EdgeInsets.all(10),
  child: BlocBuilder<PostsBloc, PostsState>(
    builder: (context, state) {
      if(state is LoadingPostsState){
        return Loadingwidget();
      }else if (state is LoadedPostsState){
        return RefreshIndicator(onRefresh:()=> _onrefresh(context),
        child: Postlistwidget(posts: state.posts,));
      }else if (state is ErrorPostsState){
        return ErrorWidgett(message: state.errormessage,);
      }
      return Container(child: Text("no data"),);
    },
  ));
}
Widget  _floatingActionButton(BuildContext context){
return FloatingActionButton(
  backgroundColor: Colors.blue,
  onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>AddUpdatePostScreen(appbar_name: 'Add post', prosses_name: "Add",)));
},child: Icon(
  Icons.add
),);
}
Future<void> _onrefresh(BuildContext context)async{
  BlocProvider.of<PostsBloc>(context).add(RefreshPostsEvent());
}