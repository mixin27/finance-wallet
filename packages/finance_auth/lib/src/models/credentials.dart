class Credentials {
  final String email;
  final String password;
  final bool rememberMe;

  Credentials({
    required this.email,
    required this.password,
    this.rememberMe = false,
  });

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password, 'rememberMe': rememberMe};
  }

  Credentials copyWith({String? email, String? password, bool? rememberMe}) {
    return Credentials(
      email: email ?? this.email,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }

  @override
  String toString() {
    return 'Credentials(email: $email, rememberMe: $rememberMe)';
  }
}
