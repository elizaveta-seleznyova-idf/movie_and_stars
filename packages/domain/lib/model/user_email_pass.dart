class UserEmailPass {
  const UserEmailPass(
    this.login,
    this.password,
  );

  final String login;
  final String password;

  factory UserEmailPass.fromJson(Map<String, dynamic> json) => UserEmailPass(
        json['login'] as String,
        json['password'] as String,
      );

  Map<String, dynamic> toJson(UserEmailPass instance) => <String, dynamic>{
    'login': instance.login,
    'password': instance.password,
  };
}
