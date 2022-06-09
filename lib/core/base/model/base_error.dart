import 'package:network_manager_template2/core/init/network/IResponseModel.dart';

class BaseError extends IErrorModel {
  final String message;
  BaseError(this.message);
}
