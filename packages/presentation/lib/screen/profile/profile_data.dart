class ProfileData {
  final String errorMessage;

  const ProfileData({required this.errorMessage});

  ProfileData copyWith({
    String? errorMessage,
  }) {
    return ProfileData(
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory ProfileData.init() => const ProfileData(
    errorMessage: '',
  );
}