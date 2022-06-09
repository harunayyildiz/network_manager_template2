//part of kullanımında importları kaldır.
part of './core_dio.dart';

extension _CoreDioOperation on CoreDio {
  R? _responseParser<R, T extends BaseModel>(T model, dynamic data) {
    if (data is List) {
      return data.map((e) => model.fromJson(e)).cast<T>().toList() as R;
    } else if (data is Map) {
      return model.fromJson(data as Map<String, Object>) as R;
    }
    return data as R;
  }
}
