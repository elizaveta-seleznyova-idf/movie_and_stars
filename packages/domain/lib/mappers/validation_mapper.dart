import 'package:domain/enum/error_type.dart';
import 'package:domain/mappers/base_mapper.dart';
import 'package:domain/model/validation.dart';

class ValidationMapper extends Mapper<Validation?, ValidationErrorType?> {
  @override
  ValidationErrorType? call(Validation? params) {
    if (params is RequiredFieldValidation) {
      return ValidationErrorType.requiredErrorType;
    }
    if (params is MinLengthValidation) {
      return ValidationErrorType.minLengthErrorType;
    }
    if (params is RegexValidation) {
      return ValidationErrorType.regexErrorType;
    }
    return null;
  }
}
