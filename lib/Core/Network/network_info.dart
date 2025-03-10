import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool>get isconnected;
}
class NetworkInfoimpl implements NetworkInfo{
  final InternetConnectionChecker connectionChecker;

  NetworkInfoimpl(this.connectionChecker);
  
  @override
  Future<bool> get isconnected => connectionChecker.hasConnection;
  
}