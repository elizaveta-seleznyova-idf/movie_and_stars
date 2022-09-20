extension IntExtension on int? {
  String getTimeString() {
    final int hour = (this ?? 0) ~/ 60;
    final int minutes = (this ?? 0) % 60;
    return '${hour.toString()}hr ${minutes.toString().padLeft(2, "0")}m';
  }
}
