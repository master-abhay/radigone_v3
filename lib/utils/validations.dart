import 'package:flutter/material.dart';

class Validations {
  // Clean the Html Tags:
  static String stripHtml(String html) {
    // Define a map for common HTML entities
    final Map<String, String> htmlEntities = {
      '&nbsp;': ' ',
      '&amp;': '&',
      '&lt;': '<',
      '&gt;': '>',
      '&quot;': '"',
      '&apos;': "'",
    };

    // Replace HTML entities with their characters
    String cleanedHtml = html;
    htmlEntities.forEach((entity, character) {
      cleanedHtml = cleanedHtml.replaceAll(entity, character);
    });

    // Remove HTML tags
    final RegExp exp = RegExp(r'<[^>]*>');
    return cleanedHtml.replaceAll(exp, '');
  }

  static bool containsUppercase(String password) {
    return password.contains(RegExp(r'[A-Z]'));
  }

  static bool containsLowercase(String password) {
    return password.contains(RegExp(r'[a-z]'));
  }

  static bool containsDigit(String password) {
    return password.contains(RegExp(r'\d'));
  }

  static bool containsSpecialCharacter(String password) {
    return password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  // Name Validation:
  static bool isNameValid(String name) {
    final regex = RegExp(r'^[a-zA-Z\u0600-\u06FF ]+$');
    if (!regex.hasMatch(name)) {
      return false;
    }

    // Check for extra spaces
    if (name.trim().split(' ').length != name.split(' ').length) {
      return false;
    }

    return true;
  }

  // Email Validation:
  static bool isEmailValid(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  // Password Validation:
  static bool isPasswordValid(String password) {
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return regex.hasMatch(password);
  }


  // Phone Number Validation:
  static bool isPhoneNumberValid(String phoneNumber) {
    final regex = RegExp(r'^\+?\d+$');
    return regex.hasMatch(phoneNumber);
  }

  // Security Answer Validation:
  static bool isSecurityAnswerValid(String answer) {
    return answer.isNotEmpty;
  }

  // Empty Field Validation:
  static bool isEmpty(String string) {
    if (string.isEmpty) {
      return false;
    }

    // Check for extra spaces
    if (string.trim().split(' ').length != string.split(' ').length) {
      return false;
    }

    return true;
  }

  // Additional Validations:

  // Check if a field is valid URL
  static bool isValidURL(String url) {
    final regex = RegExp(r'^(http|https):\/\/[^ "]+$');
    return regex.hasMatch(url);
  }

  // Check if a string is a valid date (YYYY-MM-DD)
  static bool isValidDate(String date) {
    final regex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    return regex.hasMatch(date);
  }

  // Check if a string contains only digits
  static bool isDigitsOnly(String value) {
    final regex = RegExp(r'^\d+$');
    return regex.hasMatch(value);
  }

  // Check if a string is a valid URL or empty
  static bool isValidURLorEmpty(String url) {
    return url.isEmpty || isValidURL(url);
  }

  // Check if a string is a valid phone number (allowing optional country code)
  static bool isPhoneNumberValidWithCode(String phoneNumber) {
    final regex = RegExp(r'^\+?\d{7,15}$');
    return regex.hasMatch(phoneNumber);
  }



  // Username Validation:
  static bool isUsernameValid(String username) {
    final regex = RegExp(r'^[a-zA-Z0-9_]{6,50}$');
    return regex.hasMatch(username);
  }

  // Address Validation:
  static bool isAddressValid(String address) {
    // Simple validation: check if the address is not empty and has a minimum length
    return address.isNotEmpty && address.length >= 5;
  }

  // Country Validation:
  static bool isCountryValid(String country) {
    return country.isNotEmpty;
  }

  // State Validation:
  static bool isStateValid(String state) {
    return state.isNotEmpty;
  }

  // City Validation:
  static bool isCityValid(String city) {
    return city.isNotEmpty;
  }


  // PIN Code Validation:
  static bool isPinCodeValid(String pinCode) {
    // Validate if the PIN code is exactly 5 or 6 digits long
    final regex = RegExp(r'^\d{5,6}$');
    return regex.hasMatch(pinCode);
  }


  // PAN Card Validation:
  static bool isPanCardValid(String panCard) {
    // PAN card should be exactly 10 characters long and match the pattern:
    // 5 letters, 4 digits, 1 letter (e.g., ABCDE1234F)
    final regex = RegExp(r'^[A-Z]{5}\d{4}[A-Z]$');
    return regex.hasMatch(panCard);
  }

  // GST Number Validation:
  static bool isGstNumberValid(String gstNumber) {
    // GST number should be exactly 15 characters long and follow the pattern:
    // 2 letters, 10 digits, 1 letter, 1 digit (e.g., 12ABCDE3456F1Z5)
    final regex = RegExp(r'^[A-Z0-9]{15}$');
    return regex.hasMatch(gstNumber);
  }
}

class ErrorText {
  // Name error:
  static String? getNameError({required String name}) {
    if (name.isEmpty) {
      return "Name can't be empty";
    } else if (!Validations.isNameValid(name)) {
      return "Invalid name.\nPlease use English characters only.";
    }
    return null;
  }

  // Email error:
  static String? getEmailError({required String email}) {
    if (email.isEmpty) {
      return "Email can't be empty";
    } else if (!Validations.isEmailValid(email)) {
      return "Invalid email address.\n"
          "• Ensure it contains '@' and a domain.\n"
          "• Example: user@example.com";
    }
    return null;
  }

  // Password error:
  static String? getPasswordError({required String password}) {
    if (password.isEmpty) {
      return "Password can't be empty";
    } else if (password.length < 8) {
      return "Password must be at least 8 characters long";
    } else if (!Validations.containsUppercase(password)) {
      return "Password must contain at least one uppercase letter";
    } else if (!Validations.containsLowercase(password)) {
      return "Password must contain at least one lowercase letter";
    } else if (!Validations.containsDigit(password)) {
      return "Password must contain at least one digit";
    } else if (!Validations.containsSpecialCharacter(password)) {
      return "Password must contain at least one special character";
    }
    return null;
  }

  // Password error:
  static String? getConfirmPasswordError({required String password}) {
    if (password.isEmpty) {
      return "Confirm Password can't be empty";
    } else if (password.length < 8) {
      return "Password must be at least 8 characters long";
    } else if (!Validations.containsUppercase(password)) {
      return "Password must contain at least one uppercase letter";
    } else if (!Validations.containsLowercase(password)) {
      return "Password must contain at least one lowercase letter";
    } else if (!Validations.containsDigit(password)) {
      return "Password must contain at least one digit";
    } else if (!Validations.containsSpecialCharacter(password)) {
      return "Password must contain at least one special character";
    }
    return null;
  }



  // Phone Number error:
  static String? getPhoneNumberError({required String phoneNumber}) {
    if (phoneNumber.isEmpty) {
      return "Phone number can't be empty";
    } else if (!Validations.isPhoneNumberValid(phoneNumber)) {
      return "Invalid phone number";
    }
    return null;
  }

  // Security answer error:
  static String? getSecurityAnswerError({required String answer}) {
    if (answer.isEmpty) {
      return "Security answer can't be empty";
    } else if (!Validations.isSecurityAnswerValid(answer)) {
      return "Invalid security answer";
    }
    return null;
  }

  // Empty Field Error:
  static String? getEmptyFieldError({required String fieldName}) {
    if (fieldName.isEmpty) {
      return "Field can't be empty";
    } else if (!Validations.isEmpty(fieldName)) {
      return "Invalid field value";
    }
    return null;
  }

  // Username error:
  static String? getUsernameError({required String username}) {
    if (username.isEmpty) {
      return "Username can't be empty";
    } else if (!Validations.isUsernameValid(username)) {
      return "Invalid username.\n"
          "• Must be 6-50 characters long.\n"
          "• Can include letters, numbers, and underscores.";
    }
    return null;
  }

  // Address error:
  static String? getAddressError({required String address}) {
    if (address.isEmpty) {
      return "Address can't be empty";
    } else if (!Validations.isAddressValid(address)) {
      return "Invalid address.\n"
          "• Address must be at least 5 characters long.\n"
          "• Please provide a complete address including street name and number.";
    }
    return null;
  }

  // Country error:
  static String? getCountryError({required String country}) {
    if (country.isEmpty) {
      return "Country can't be empty";
    } else if (!Validations.isCountryValid(country)) {
      return "Invalid country.\n"
          "• Please enter a valid country name.";
    }
    return null;
  }

  // State error:
  static String? getStateError({required String state}) {
    if (state.isEmpty) {
      return "State can't be empty";
    } else if (!Validations.isStateValid(state)) {
      return "Invalid state.\n"
          "• Please enter a valid state name.";
    }
    return null;
  }

  // City error:
  static String? getCityError({required String city}) {
    if (city.isEmpty) {
      return "City can't be empty";
    } else if (!Validations.isCityValid(city)) {
      return "Invalid city.\n"
          "• Please enter a valid city name.";
    }
    return null;
  }

  // PIN Code error:
  static String? getPinCodeError({required String pinCode}) {
    if (pinCode.isEmpty) {
      return "PIN code can't be empty";
    } else if (!Validations.isPinCodeValid(pinCode)) {
      return "Invalid PIN code.\n"
          "• Must be 5 or 6 digits long.\n"
          "• Please ensure the PIN code is numeric.";
    }
    return null;
  }

  // PAN Card error:
  static String? getPanCardError({required String panCard}) {
    if (panCard.isEmpty) {
      return "PAN card can't be empty";
    } else if (!Validations.isPanCardValid(panCard)) {
      return "Invalid PAN card:\n"
          "• Must be exactly 10 characters long\n"
          "• Should follow this format:\n"
          "  - 5 uppercase letters\n"
          "  - 4 digits\n"
          "  - 1 uppercase letter\n"
          "• Example: ABCDE1234F";
    }
    return null;
  }

  // GST Number error:
  static String? getGstNumberError({required String gstNumber}) {
    if (gstNumber.isEmpty) {
      return "GST number can't be empty";
    } else if (!Validations.isGstNumberValid(gstNumber)) {
      return "Invalid GST number.\n"
          "• Must be exactly 15 characters long.\n"
          "• Should follow this pattern: 2 letters, 10 digits, 1 letter, 1 digit.\n"
          "• Example: 12ABCDE3456F1Z5";
    }
    return null;
  }
}
