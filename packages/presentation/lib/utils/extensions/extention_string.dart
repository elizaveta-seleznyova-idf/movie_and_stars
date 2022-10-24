import 'package:intl/intl.dart';

extension StrignExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String convertData() {
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(this);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MMMM dd, yyyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }
}

extension StringOrEmpty on String? {
  String orEmpty() {
    return this ?? '';
  }
}
