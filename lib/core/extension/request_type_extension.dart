import '../enums/request_type.dart';

extension RequestTypeExtension on RequestType {
  String get rawValue {
    switch (this) {
      case RequestType.get:
        return "GET";
      case RequestType.post:
        return "POST";
      case RequestType.put:
        return "PUT";
      case RequestType.delete:
        return "DELETE";
    }
  }
}
