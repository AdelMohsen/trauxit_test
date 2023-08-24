validateEmail(String? value) {
  String pattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(?:\.[a-zA-Z]{2,})?$';
  // r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
  // r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
  // r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'Enter a valid email address';
  } else if (!value.contains('.')) {
    return 'Enter a valid email address';
  } else {
    return null;
  }
}

validatePassword(String? value) {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value!.isEmpty) {
    return 'At Least 8 characters must contains[1-Uppercase 1-lowercase 1-Numeric 1-Special Character]';
  } else {
    if (!regex.hasMatch(value)) {
      return 'At Least 8 characters must contains[1-Uppercase 1-lowercase 1-Numeric 1-Special Character]';
    } else {
      return null;
    }
  }
}

bool isConstructorReturnValue(dynamic value) {
  if (value != null && value != 'null' && value != '') {
    return true;
  } else {
    return false;
  }
}

bool checkFromArray(dynamic myArray) {
  if (myArray != null && myArray is List && myArray.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}
