import 'dart:async';

import 'package:dartz/dartz.dart';

class BaseRepository {
  BaseRepository();

  /// [T] is Return type for [EitherResponse]
  ///
  /// [R] is response type from server that is params for [onSuccess] callback
  ///
  /// [onSuccess] callback returns the [T] and accept [R]
  Future<Either<String?, T>> handleNetworkCall<R, T>({
    required Future<R> apiCall,
    required FutureOr<T> Function(R data) onSuccess,
  }) async {
    try {
      final data = await apiCall;
      return right(await onSuccess(data));
    } on String catch (e) {
      return left(e);
    }
  }
}
