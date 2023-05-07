import 'dart:async';

import 'package:dio/dio.dart';
import 'package:weatherapp/core/error_extension.dart';

/// [BaseRemoteSource] for handling network requests for dio client
class BaseRemoteSource {
  BaseRemoteSource();

  final dioClient = Dio();

  /// [T] is return type from network request
  ///
  /// [request] callback returns [Response] and accepts [Dio] instance
  ///
  /// [onResponse] callback returns [T] and accepts [dynamic] data from [Response]
  ///
  /// throws [ApiException]

  Future<T> networkHandler<T>({
    required Future<Response<Map<String, dynamic>>> Function(Dio dio) request,
    required FutureOr<T> Function(Map<String, dynamic> data) onResponse,
  }) async {
    try {
      final Response<Map<String, dynamic>> response = await request(dioClient);
      if (response.statusCode! == 200) {
        return await onResponse(response.data!);
      } else {
        throw 'UnExpected Error Occurred!!!';
      }
    } on DioError catch (e) {
      throw e.toApiException;
    } catch (e) {
      throw e.toString();
    }
  }
}
