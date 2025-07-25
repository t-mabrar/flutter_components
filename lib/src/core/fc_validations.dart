class FCValidations {
  static String? validate({AppValidations? type, String? value}) {
    switch (type) {
      case AppValidations.username:
        return validateUsername(value!);
      case AppValidations.requiredField:
        return validateRequired(value!);
      case AppValidations.email:
        return validateEmail(value!);
      case AppValidations.password:
        return validatePassword(value!);
      case AppValidations.name:
        return validateName(value!);
      case AppValidations.phoneNumber:
        return validatePhone(value!);
      case AppValidations.price:
        return validatePrice(value!);
      case AppValidations.numericValue:
        return validateNumeric(value: value!);
      case AppValidations.alphaNumericValue:
        return validateAlphaNumeric(value!);
      case AppValidations.directionLatLng:
        return validateDirectionLatLng(value: value!);
      case AppValidations.onlyInteger:
        return validateInteger(value: value!);
      case AppValidations.gst:
        return validateGST(value: value!);
      case AppValidations.pan:
        return validatePan(value: value!);
      case AppValidations.fassai:
        return validateFassai(value: value!);
      case AppValidations.domainSelection:
        return validateDomainSelection(value: value);

      default:
        return null;
    }
  }

  static String? validateDirectionLatLng({required String value}) {
    const String pattern = r'^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$';
    final RegExp regex = RegExp(pattern);

    if (value.isEmpty) {
      return "Field can't be empty";
    } else if (!regex.hasMatch(value)) {
      return 'Only Numbers accepted';
    } else {
      return null;
    }
  }

  static String? validateName(String value) {
    if (value.isEmpty || value.trim().isEmpty) return 'Name is required.';
    final RegExp nameExp = RegExp(r'^[A-za-z ]+$');
    if (!nameExp.hasMatch(value)) {
      return 'Please enter only alphabetical characters.';
    }
    return null;
  }

  static String? validateEmail(String value) {
    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter Valid Email';
    } else {
      return null;
    }
  }

  static String? validateInteger({required String value, bool? required}) {
    const String pattern = r'^[0-9]*$';
    final RegExp regex = RegExp(pattern);

    if (value.isEmpty && !required!) {
      return null;
    } else if (!regex.hasMatch(value)) {
      return 'Only Integer is accepted';
    } else {
      return null;
    }
  }

  static String? validateGST({required String value, bool? required}) {
    if (value.isNotEmpty) {
      if (value.length < 15) {
        return 'Enter your 15 digits GSTIN';
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static String? validatePan({required String value, bool? required}) {
    if (value.isNotEmpty) {
      if (value.length < 10) {
        return 'Enter your 10 digits PAN';
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static String? validateFassai({required String value, bool? required}) {
    if (value.isNotEmpty) {
      if (value.length < 20) {
        return 'Enter your 20 digits FSSAI Number';
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static String? validateNumeric({required String value}) {
    const String pattern = r'^(0|[1-9]\d*)?(\.\d+)?(?<=\d)$';
    final RegExp regex = RegExp(pattern);

    if (value.isEmpty) {
      return null;
    } else if (!regex.hasMatch(value)) {
      return 'Only Numbers accepted';
    } else {
      return null;
    }
  }

  static String? validateAlphaNumeric(String value) {
    if (value.isEmpty || value.trim().isEmpty) return 'Field is required.';
    final RegExp nameExp = RegExp(r'^[a-zA-Z0-9 _.-]*$');
    if (!nameExp.hasMatch(value)) {
      return 'Please enter only alphabets and Numbers.';
    }
    return null;
  }

  static String? validatePassword(String value) {
    const String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$';
    final RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return 'Enter the password';
    } else if (!regex.hasMatch(value)) {
      return 'Please choose strong a password.';
    } else {
      return null;
    }
  }

  static String? validateUsername(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return "Enter Email ID / Phone Number";
    }
    return null;
  }

  static String? validateRequired(String value) {
    if (value.isEmpty || value.trim().isEmpty) return "Field can't be empty";
    return null;
  }

  static String? validatePhone(String value) {
    const String regExpString = '[0-9]{10}';
    final RegExp pattern = RegExp(regExpString);
    if (value.isEmpty || value.length < 10 || !pattern.hasMatch(value)) {
      return 'Mobile Number must be valid';
    } else {
      return null;
    }
  }

  static String? validatePrice(String value) {
    if (value.isEmpty) {
      return 'Price must be valid';
    } else if (double.parse(value) <= 0) {
      return 'Price must be greater than 0';
    } else {
      return null;
    }
  }

  static String? validateDomainSelection({required String? value}) {
    if (value == null) {
      return null;
    } else {
      if (value.isEmpty) {
        return 'Subdomain is mandatory';
      } else if (value.length < 6) {
        return 'Subdomain must be more than or equal to 6';
      } else if (value.length > 36) {
        return 'Subdomain must be less than or equal to 36';
      } else {
        return null;
      }
    }
  }
}

enum AppValidations {
  domainSelection,
  username,
  requiredField,
  name,
  price,
  numericValue,
  alphaNumericValue,
  email,
  password,
  phoneNumber,
  directionLatLng,
  onlyInteger,
  gst,
  pan,
  fassai,
}
