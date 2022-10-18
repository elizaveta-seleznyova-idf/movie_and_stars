abstract class Validation {
  bool isValid(Object validate);
}

class RequiredFieldValidation extends Validation {
  @override
  bool isValid(Object validate) {
    if (validate is String) {
      return validate.isNotEmpty;
    } else {
      return false;
    }
  }
}

class MinLengthValidation extends Validation {
  MinLengthValidation({required this.minLength});

  final int minLength;

  @override
  bool isValid(Object validate) {
    if (validate is String) {
      return validate.length >= minLength;
    } else {
      return false;
    }
  }
}

class RegexValidation extends Validation {
  RegexValidation({required this.regex});

  String regex;

  @override
  bool isValid(Object validate) {
    if (validate is String) {
      return RegExp(regex).hasMatch(validate);
    } else {
      return false;
    }
  }
}
