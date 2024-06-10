class DoctorModel {
  String name;
  String image;
  String spcl;
  String exp;
  String time;
  String date;
  double cons;
  double admin;
  double dis;
  String id;

  DoctorModel({
    required this.name,
    required this.time,
    required this.date,
    required this.cons,
    required this.admin,
    required this.dis,
    required this.image,
    required this.spcl,
    required this.exp,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'time': this.time,
      'date': this.date,
      'cons': this.cons,
      'admin': this.admin,
      'dis': this.dis,
      'image': this.image,
      'spcl': this.spcl,
      'exp': this.exp,
      'id': this.id,
    };
  }

  factory DoctorModel.fromMap(Map<String, dynamic>map){
    return DoctorModel(
      cons: map['cons'].toDouble() ?? "",
      admin: map['admin'].toDouble() ?? "",
      dis: map['dis'].toDouble() ?? "",
      exp: map['exp'] ?? "",
      image: map['image'] ?? "",
      spcl: map['spcl'] ?? "",
      time: map['time'] ?? "",
      date: map['date'] ?? "",
      name: map['name'] ?? "",
      id: map['id'] ?? "",
    );
  }

  DoctorModel copyWith({
    String? name,
    String? date,
    String? time,
    double? cons,
    double? admin,
    double? dis,
    String? image,
    String? exp,
    String? spcl,
    String? id,
  }) {
    return DoctorModel(
      name: name ?? this.name,
      date: date ?? this.date,
      time: time ?? this.time,
      cons: cons ?? this.cons,
      admin: admin ?? this.admin,
      dis: dis ?? this.dis,
      image: image ?? this.image,
      id: id ?? this.id,
      spcl: spcl ?? this.spcl,
      exp: exp ?? this.exp,
    );
  }
}
