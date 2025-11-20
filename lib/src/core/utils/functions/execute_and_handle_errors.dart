import '../../loggers/debug_logger.dart';
import '../../networking/internet_checker.dart';
import '../../supabase/error_handler.dart';
import '../../supabase/supabase_request_result.dart';
import '../app_strings.dart';

Future<SupabaseRequestResult<T>> executeAndHandleErrors<T>(
  Future Function() function,
) async {
  final internetChecker = InternetChecker.instance;
  if (await internetChecker.isConnected) {
    try {
      final response = await function();
      return SupabaseRequestResult<T>.success(response);
    } catch (error) {
      DebugLogger.log(
        '>>>>>>>>> CATCHED IN executeAndHandleErrors: $error <<<<<<<<<<',
      );
      return SupabaseRequestResult.failure(ErrorHandler.handleError(error));
    }
  } else {
    return SupabaseRequestResult.failure(
      ErrorHandler.handleError(AppStrings.noInternetConnection),
    );
  }
}
