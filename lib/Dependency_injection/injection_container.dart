import 'package:flutter_application_1/Core/Network/network_info.dart';
import 'package:flutter_application_1/features/posts/data/dataSurces/post_local_dataSurce.dart';
import 'package:flutter_application_1/features/posts/data/dataSurces/post_remote_dataSurce.dart';
import 'package:flutter_application_1/features/posts/data/repositoris/post_repository_impl.dart';
import 'package:flutter_application_1/features/posts/domain/repositoris/posts_repository.dart';
import 'package:flutter_application_1/features/posts/domain/usecases/get_all_posts.dart';
import 'package:flutter_application_1/features/posts/presentation/bloc/add_delete_update_post/bloc/add_delete_update_post_bloc.dart';
import 'package:flutter_application_1/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! 🟢 External Dependencies (Register First)
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker.createInstance());


  //! 🟢 Core Dependencies
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl())); // ✅ Uses InternetConnectionChecker

  //! 🟢 Data Sources
  sl.registerLazySingleton<PostRemoteDataSource>(() => PostRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<PostLocalDatasurce>(() => PostLocalDatasurceImpl(sl()));

  //! 🟢 Repositories
  sl.registerLazySingleton<PostsRepository>(() => PostRepositoryImpl(sl(), sl(), sl()));

  //! 🟢 Use Cases
  sl.registerLazySingleton(() => GetAllPostsUsecase(sl()));
  sl.registerLazySingleton(() => UpdatePost(sl()));
  sl.registerLazySingleton(() => DeletePost( postid: sl(),)); // ✅ FIXED
  sl.registerLazySingleton(() => AddPost(sl()));

  //! 🟢 Blocs
  sl.registerFactory(() => PostsBloc(sl()));
  sl.registerFactory(() => AddDeleteUpdatePostBloc(sl(), sl(), sl()));
}
