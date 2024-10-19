import 'package:data/src/entity/remote/error/error_entity.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

NetworkError getError({required Response apiResponse}) {
  if (apiResponse.data != null) {
    try {
      final ErrorEntity errorResponseEntity =
          ErrorEntity.fromJson(apiResponse.data);
      return NetworkError(
        httpError: errorResponseEntity.code ?? 1000,
        message: errorResponseEntity.message ?? '',
        cause: Exception("Server Response Error"),
      );
    } catch (exception) {
      // exception.printStackTrace();
      return NetworkError(
          cause: Exception("Server Response Error"),
          httpError: apiResponse.statusCode!,
          message: apiResponse.statusMessage!);
    }
  } else {
    return NetworkError(
        cause: Exception("Server Response Error"),
        httpError: apiResponse.statusCode!,
        message: apiResponse.statusMessage!);
  }
}
