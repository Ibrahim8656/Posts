import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_theme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        title: 'Posts App',
        home: Scaffold(
          appBar:AppBar(title: Text('Posts'),),
          body: Center(child: Text("Hellow world")),
        ));
  }
}