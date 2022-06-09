// ignore_for_file: file_names
import 'package:network_manager_template2/core/init/network/IResponseModel.dart';

import '../../base/model/base_model.dart';
import '../../enums/request_type.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> send<R, T extends BaseModel>(String path,
      {required RequestType requestType,
      required T parseModel,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      void Function(int, int)? onReceiveProgress});
}
