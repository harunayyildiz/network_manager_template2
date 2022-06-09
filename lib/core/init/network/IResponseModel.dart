// ignore_for_file: file_names
//send methodunun Response dönüş değerinin hata ile karşılaşma durumundan dolayı
//IResponse model oluşturuldu.

abstract class IResponseModel<T> {
  T? data;
  IErrorModel? baseError;
}

abstract class IErrorModel<T> {
  void statusCode() {}
}

class ResponseModel<T> extends IResponseModel<T> {
  @override
  final T? data;
  final IErrorModel? error;
  ResponseModel({this.data, this.error});
}
