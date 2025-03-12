import 'package:flutter/material.dart';

class ErrorWidgett extends StatelessWidget {
  final String message;
  const ErrorWidgett({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height/3,
      child: Center(child:  Text(message)));
  }
}