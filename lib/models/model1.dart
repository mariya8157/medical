class UsersModel {
  String name;
  String email;
  String password;

  UsersModel({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
      'password': this.password,
    };
  }

  factory UsersModel.fromMap(Map<String, dynamic>map){
    return UsersModel(
      password: map['password'] ?? "",
      email: map['email'] ?? "",
      name: map['name'] ?? "",
    );
  }

  UsersModel copyWith({
    String? name,
    String? password,
    String? email,
  }) {
    return UsersModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
