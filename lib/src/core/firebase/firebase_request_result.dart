import 'package:freezed_annotation/freezed_annotation.dart';

import 'firebase_error_model.dart';

part 'firebase_request_result.freezed.dart';

@freezed
abstract class FirebaseRequestResult<T> with _$FirebaseRequestResult<T> {
  const factory FirebaseRequestResult.success(T data) = Success<T>;
  const factory FirebaseRequestResult.failure(FirebaseErrorModel errorModel) =
      Failure<T>;
}
