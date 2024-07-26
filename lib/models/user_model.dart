class UsersModel {
  String name;
  String email;
  String password;
  List cart;
  List wish;
  String id;

  UsersModel({
    required this.name,
    required this.email,
    required this.password,
    required this.id,
    required this.cart,
    required this.wish,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
      'password': this.password,
      'id': this.id,
      'cart': this.cart,
      'wish': this.wish,
    };}

  factory UsersModel.fromMap(Map<String, dynamic>map){
    return UsersModel(
      password: map['password'] ?? "",
      email: map['email'] ?? "",
      name: map['name'] ?? "",
      id: map['id'] ?? "",
      cart: map['cart'] ?? "",
      wish: map['wish'] ?? "",
    );
  }

  UsersModel copyWith({
    String? name,
    String? password,
    String? email,
    String? id,
    List? cart,
    List? wish,
  }) {
    return UsersModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      id: id ?? this.id,
      cart: cart ?? this.cart,
      wish: wish ?? this.wish,
    );
  }
}
