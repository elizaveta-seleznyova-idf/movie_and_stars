import 'package:domain/enum/login_error_type.dart';
import 'package:domain/mappers/base_mapper.dart';
import 'package:domain/model/validation.dart';

class ValidationMapper extends Mapper<Validation?, ValidationLoginErrorType?> {
  @override
  ValidationLoginErrorType? call(Validation? params) {
    if (params is RequiredFieldValidation) {
      return ValidationLoginErrorType.requiredErrorType;
    }
    if (params is MinLengthValidation) {
      return ValidationLoginErrorType.minLengthErrorType;
    }
    if (params is RegexValidation) {
      return ValidationLoginErrorType.regexErrorType;
    }
    return null;
  }
}
