class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  User(
      {this.id = 1,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
    };
  }
}
