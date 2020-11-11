class User {
  final String email;
  final String name;
  final bool emailVerified;
  final String password;
  final String username;
  final int kycLevel;

  User(
      {this.email,
      this.name,
      this.emailVerified,
      this.password,
      this.username,
      this.kycLevel});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] as String,
      name: json['name'] as String,
      emailVerified: json['emailVerified: '] as bool,
      password: '',
      username: json['username'] as String,
      kycLevel: json['kycLevel'] as int ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['name'] = name;
    map['password'] = password;
    map['username'] = username;
    map['kycLevel'] = kycLevel;
    return map;
  }
}
