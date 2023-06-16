import 'package:practical_using_provider/utils/extensions.dart';

class TextFieldValidator {
  static String? validateString(String s, String title) {
    s = s.trim();
    if (s.isEmpty) {
      return "$title field is required";
    }
    return null;
  }

  static String? validateEmail(String email) {
    email = email.trim();
    if (email.isEmpty) {
      return "Email field is required";
    }
    if (!email.isEmail) {
      return "Invalid email address";
    }
    return null;
  }

  static String? validateMobile(String mobile) {
    mobile = mobile.trim();
    if (mobile.isEmpty) {
      return "Mobile field is required";
    }
    if (mobile.length != 10) {
      return "Enter a valid 10 digit number";
    }
    return null;
  }
}
