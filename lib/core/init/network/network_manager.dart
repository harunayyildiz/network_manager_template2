import 'package:dio/dio.dart';
import 'ICoreDio.dart';
import 'core_dio.dart';

class NetworkManager {
  static NetworkManager? _instace;
  static NetworkManager get instance => _instace ??= NetworkManager._init();

  ICoreDio? coreDio;
  //Dio? dio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      headers: {'val': 'TOKEN'},
    );

    //dio = Dio(baseOptions);
    coreDio = CoreDio(baseOptions);
  }
}
