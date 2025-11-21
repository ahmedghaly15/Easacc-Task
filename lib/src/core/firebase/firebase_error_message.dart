class FirebaseErrorMessage {
  FirebaseErrorMessage._();

  static const String userNotFound = "No user found for this email.";
  static const String wrongPassword = "The password you entered is incorrect.";
  static const String weakPassword =
      "The password is too weak. Try a stronger one.";
  static const String emailAlreadyInUse =
      "This email is already registered. Try logging in.";
  static const String invalidEmail = "The email address is invalid.";
  static const String invalidCredential =
      "The provided credentials are invalid.";
  static const String requiresRecentLogin =
      "Please log in again to perform this action.";
  static const String networkRequestFailed =
      "Network error. Check your internet connection.";
  static const String userDisabled = "This user account has been disabled.";
  static const String userTokenExpired =
      "Your session has expired. Please log in again.";
  static const String unknown =
      "An unexpected error occurred. Please try again.";
}
