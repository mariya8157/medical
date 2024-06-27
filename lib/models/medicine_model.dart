class MedicineModel {
  String image;
  String name;
  String ml;
  double rate;
  double off;
  String id;
  String des;
  int qty;
  String userId;

  MedicineModel({
    required this.name,
    required this.image,
    required this.ml,
    required this.rate,
    required this.off,
    required this.id,
    required this.des,
    required this.qty,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'image': this.image,
      'ml': this.ml,
      'off': this.off,
      'rate': this.rate,
      'id': this.id,
      'des': this.des,
      'qty': this.qty,
      'userId': this.userId,
    };
  }

  factory MedicineModel.fromMap(Map<String, dynamic>map){
    return MedicineModel(
      rate: map['rate'].toDouble() ?? "",
      off: map['off'].toDouble() ?? "",
      image: map['image'] ?? "",
      ml: map['ml'] ?? "",
      name: map['name'] ?? "",
      id: map['id'] ?? "",
      des: map['des'] ?? "",
      qty: map['qty'] ?? "",
      userId: map['userId'] ?? "",
    );
  }

  MedicineModel copyWith({
    String? name,
    String? image,
    double? rate,
    double? off,
    String? ml,
    String? id,
    String? des,
    int? qty,
    String? userId,
  }) {
    return MedicineModel(
      name: name ?? this.name,
      image: image ?? this.image,
      id: id ?? this.id,
      ml: ml ?? this.ml,
      off: off ?? this.off,
      rate: rate ?? this.rate,
      des: des ?? this.des,
      qty: qty ?? this.qty,
      userId: userId ?? this.userId,
    );
  }
}
