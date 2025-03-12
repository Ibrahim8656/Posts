import 'package:flutter_application_1/Core/Errors/failures.dart';
import 'package:flutter_application_1/Core/strings/failuer.dart';

String errormessage(Failuers failure){
  switch (failure.runtimeType) {
    case OflineFailuer():return OFFLINE_FAILURE_MESSAGE;
    case EmptyChacheFailuer():return EMPTY_CACHE_FAILURE_MESSAGE;
    case ServerFailuer():return SERVER_FAILURE_MESSAGE;
    
    default:return  "UnExpected Error,plase try later";
  }

}
