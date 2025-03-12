import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/blocobserver/bloc_observer.dart';
import 'package:flutter_application_1/core/app_theme.dart';
import 'package:flutter_application_1/features/posts/presentation/bloc/add_delete_update_post/bloc/add_delete_update_post_bloc.dart';
import 'package:flutter_application_1/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:flutter_application_1/features/posts/presentation/screens/posts_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Dependency_injection/injection_container.dart'as di;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await di.init();
    Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<PostsBloc>()..add(GetAllpostsEvent()),
        ),
        BlocProvider(
            create: (_) => di.sl<AddDeleteUpdatePostBloc>(),
        ),
      ],
      child:   MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        title: 'Posts App',
        home:PostsScreen()),
    );
    
    
   
  }
}