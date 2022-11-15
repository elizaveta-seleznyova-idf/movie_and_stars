import 'package:domain/mappers/base_mapper.dart';
import 'package:intl/intl.dart';

class ConvertStringToDate extends Mapper<String, DateTime> {
  @override
  DateTime call(String params) {
    DateTime parseDate =
        DateFormat("EEE, d MMM yyyy HH:mm:ss", 'en').parse(params);
    return parseDate;
  }
}

class ConvertSavedDateToDate extends Mapper<String, DateTime> {
  @override
  DateTime call(String params) {
    DateTime convertedDate = DateTime.parse(params);
    return convertedDate;
  }
}
