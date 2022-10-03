extension DoubleExtension on double {
  double getTimeDouble() {
    return double.parse((this / 2).toStringAsFixed(1));
  }
}
