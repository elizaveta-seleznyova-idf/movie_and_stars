extension StrignExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension StringOrEmpty on String? {
  String orEmpty() {
    return this ?? '';
  }
}
