import 'dart:io';

import 'package:data/src/util/get_error.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:retrofit/retrofit.dart';

Future<Either<NetworkError, T>> safeApiCall<T>(Future<T> apiCall) async {
  try {
    final originalResponse = await apiCall;
    final eitherResponse = originalResponse as HttpResponse<dynamic>;
    if (!eitherResponse.isSuccessful()) {
      return left(getError(apiResponse: eitherResponse.response));
    } else {
      return right(originalResponse);
    }
  } on Exception catch (throwable) {
    switch (throwable.runtimeType) {
      case DioException:
        switch ((throwable as DioException).type) {
          case DioExceptionType.connectionTimeout:
            //"Connection timeout with API server";
            break;
          case DioExceptionType.sendTimeout:
            //"Receive timeout exception";
            break;
          case DioExceptionType.receiveTimeout:
            //"Receive timeout in connection with API server";
            break;
          case DioExceptionType.badCertificate:
          // TODO: Handle this case.
          case DioExceptionType.badResponse:
          // TODO: Handle this case.
          case DioExceptionType.cancel:
          // TODO: Handle this case.
          case DioExceptionType.connectionError:
          // TODO: Handle this case.
          case DioExceptionType.unknown:
          // TODO: Handle this case.
        }

        break;

      case IOException:
        return left(NetworkError(
            message: throwable.toString(), httpError: 502, cause: throwable));

      case HttpException:
        return left(NetworkError(
            message: (throwable as HttpException).message,
            httpError: 502,
            cause: throwable));

      default:
        return left(NetworkError(
            message: throwable.toString(), httpError: 502, cause: throwable));
    }
    return left(NetworkError(
        message: throwable.toString(), httpError: 502, cause: throwable));
  }
}

extension RetrofitResponse on HttpResponse {
  /// Returns true if the code is in [200..300), which means the request was successfully received,
  /// understood, and accepted.
  bool isSuccessful() {
    return response.statusCode! >= 200 && response.statusCode! < 300;
  }
}
