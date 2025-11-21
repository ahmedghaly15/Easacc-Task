import '../../loggers/debug_logger.dart';
import '../../networking/internet_checker.dart';
import '../../firebase/firebase_error_handler.dart';
import '../../firebase/firebase_request_result.dart';
import '../app_strings.dart';

Future<FirebaseRequestResult<T>> executeAndHandleErrors<T>(
  Future Function() function,
) async {
  final internetChecker = InternetChecker.instance;
  if (await internetChecker.isConnected) {
    try {
      final response = await function();
      return FirebaseRequestResult<T>.success(response);
    } catch (error) {
      DebugLogger.log(
        '>>>>>>>>> CAUGHT IN executeAndHandleErrors: $error <<<<<<<<<<',
      );
      return FirebaseRequestResult.failure(
        FirebaseErrorHandler.handleError(error),
      );
    }
  } else {
    return FirebaseRequestResult.failure(
      FirebaseErrorHandler.handleError(AppStrings.noInternetConnection),
    );
  }
}
