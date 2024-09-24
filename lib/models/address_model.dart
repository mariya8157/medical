class AddressModel {
  String name;
  int phone;
  int pincode;
  String street;
  String city;
  String country;
  String houseName;
  String id;
  String userId;
  String itemName;
  String itemImage;
  String itemMl;
  int itemQty;
  int itemRate;
  List cart;

  AddressModel({
    required this.name,
    required this.phone,
    required this.pincode,
    required this.street,
    required this.city,
    required this.country,
    required this.houseName,
    required this.id,
    required this.itemName,
    required this.itemImage,
    required this.itemMl,
    required this.itemQty,
    required this.itemRate,
    required this.userId,
    required this.cart,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'phone': this.phone,
      'pincode': this.pincode,
      'street': this.street,
      'city': this.city,
      'country': this.country,
      'houseName': this.houseName,
      'id': this.id,
      'itemName': this.itemName,
      'itemQty': this.itemQty,
      'itemImage': this.itemImage,
      'itemMl': this.itemMl,
      'itemRate': this.itemRate,
      'userId': this.userId,
      'cart': this.cart,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      phone: map['phone'] ?? "",
      pincode: map['pincode'] ?? "",
      street: map['street'] ?? "",
      city: map['city'] ?? "",
      country: map['country'] ?? "",
      houseName: map['houseName'] ?? "",
      name: map['name'] ?? "",
      id: map['id'] ?? "",
      itemName: map['itemName'] ?? "",
      itemQty: map['itemQty'] ?? "",
      itemImage: map['itemImage'] ?? "",
      itemMl: map['itemMl'] ?? "",
      itemRate: map['itemRate'] ?? "",
      userId: map['userId'] ?? "",
      cart: map['cart'] ?? "",
    );
  }

  AddressModel copyWith({
    String? name,
    int? phone,
    int? pincode,
    String? street,
    String? city,
    String? country,
    String? houseName,
    String? id,
    String? itemName,
    String? itemImage,
    String? itemMl,
    int? itemQty,
    String? userId,
    int? itemRate,
    List? cart,
  }) {
    return AddressModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      pincode: pincode ?? this.pincode,
      street: street ?? this.street,
      city: city ?? this.city,
      country: country ?? this.country,
      houseName: houseName ?? this.houseName,
      id: id ?? this.id,
      itemName: itemName ?? this.itemName,
      itemImage: itemImage ?? this.itemImage,
      itemQty: itemQty ?? this.itemQty,
      itemMl: itemMl ?? this.itemMl,
      itemRate: itemRate ?? this.itemRate,
      userId: userId ?? this.userId,
      cart: cart ?? this.cart,
    );
  }
}
