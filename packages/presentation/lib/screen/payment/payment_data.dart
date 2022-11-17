class PaymentData{
  PaymentData({
    this.validateNumber,
    this.validateDateExpire,
    this.validateCVV,
    required this.cardNumberText,
    required this.dateExpireText,
    required this.cVVText,
  });

  final String? validateNumber;
  final String? validateDateExpire;
  final String? validateCVV;
  String cardNumberText = '';
  String dateExpireText = '';
  String cVVText = '';

  PaymentData copyWith({
    String cardNumberText = '',
    String dateExpireText = '',
    String cVVText = '',
  }) {
    return PaymentData(
      validateNumber: validateNumber ?? this.validateNumber,
      validateDateExpire: validateDateExpire ?? this.validateDateExpire,
      validateCVV: validateCVV ?? this.validateCVV,
      cardNumberText: '',
      dateExpireText: '',
      cVVText: '',
    );
  }

  factory PaymentData.init() => PaymentData(
    cardNumberText: '',
    dateExpireText: '',
    cVVText: '',
  );
}