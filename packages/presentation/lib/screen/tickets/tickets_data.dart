class TicketsData{
  TicketsData({
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

  TicketsData copyWith({
    String cardNumberText = '',
    String dateExpireText = '',
    String cVVText = '',
  }) {
    return TicketsData(
      validateNumber: validateNumber ?? this.validateNumber,
      validateDateExpire: validateDateExpire ?? this.validateDateExpire,
      validateCVV: validateCVV ?? this.validateCVV,
      cardNumberText: '',
      dateExpireText: '',
      cVVText: '',
    );
  }

  factory TicketsData.init() => TicketsData(
    cardNumberText: '',
    dateExpireText: '',
    cVVText: '',
  );
}