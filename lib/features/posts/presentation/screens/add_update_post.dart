import 'package:flutter/material.dart';

class AddUpdatePostScreen extends StatelessWidget {
  final String appbar_name;
  final String prosses_name;
  const AddUpdatePostScreen({super.key, required this.appbar_name, required this.prosses_name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(title: Center(
        child: Text(
          appbar_name
        ),
      ),),
      body: _bildBody(context),
    );
  }
}
Widget _bildBody(BuildContext context){
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 30),
      child: Column(
        children: [
          TextFormField(decoration: InputDecoration(
        border: OutlineInputBorder()
      ),),
      SizedBox(height: 30,),
      TextFormField(decoration: InputDecoration(
          border: OutlineInputBorder()
        ),)
        ],
      )
    ),
  );
}