import 'package:todo_app/utils/constants.dart';

abstract class Validator {
  static String? firstNameValidation(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return "Please enter your first name!";
    if (!AppConstant.namePatternRegExp.hasMatch(value.trim())) return "Please enter first valid name!";
    return null;
  }

  static String? lastNameValidation(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return "Please enter your last name!";
    if (!AppConstant.namePatternRegExp.hasMatch(value.trim())) return "Please enter last valid name!";
    return null;
  }

  static String? emailValidation(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return "Please enter your email!";
    if (!AppConstant.emailPatternRegExp.hasMatch(value.trim())) return "Please enter valid email!";
    return null;
  }

  static String? passwordValidation(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return "Please enter your password!";
    if (value.trim().length < 8) {
      return "Password length should be at least 8 characters long";
    }
    return null;
  }

  static String? emptyFieldValidation(String? value, {required String message}) {
    if (value == null) return null;
    if (value.isEmpty) return "Please enter your $message!";

    return null;
  }

  static String? confirmPasswordValidation(String? value, {required String password}) {
    if (value == null) return null;
    if (value.isEmpty) return "Please enter confirm password!";
    if (value != password) return "Password and confirm password must match!";
    return null;
  }

  static String? otpValidation(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return "Please enter verification code!";
    if (value.trim().length < 6) return "Please enter valid verification code!";

    return null;
  }
}
