import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:network_manager_template2/core/init/network/ICoreDio.dart';
import '../../base/model/base_error.dart';
import '../../extension/request_type_extension.dart';
import 'IResponseModel.dart';
import '../../base/model/base_model.dart';
import '../../enums/request_type.dart';

//Private extension yazıp partlamak:
part 'core_operation.dart';

class CoreDio with DioMixin implements Dio, ICoreDio {
  final BaseOptions baseOptions;
  CoreDio(this.baseOptions) {
    options = baseOptions;
    //?Bunu core veriyoruz. Aşağıdaki kullanımda otomatik Options içini dolduruyor. [1]
    //this.interceptors.add(InterceptorsWrapper());
    //Interceptor: Önleyici, içeriğindekiler onRequest,onResponse,onError : Handle etmeden önce ...
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  @override
  Future<IResponseModel<R>> send<R, T extends BaseModel>(String path,
      {required RequestType requestType,
      required T parseModel,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      void Function(int, int)? onReceiveProgress}) async {
    final response = await request(path,
        data: data,
        options: Options(method: requestType.rawValue),
        queryParameters: queryParameters); //[1]
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = _responseParser<R, T>(parseModel, response.data);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(error: BaseError("message"));
    }
  }
}
