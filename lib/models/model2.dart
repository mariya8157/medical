class Doctorsmodel{
  String? name;
  String ? spl;
  String ? date;
  int ? time;
  String ? id;

  Doctorsmodel({
    this.name,
    this.spl,
    this.date,
    this.time,
    this.id

  });
  Map<String,dynamic> toMap(){
    return{
      "name":this.name,
      "spl":this.spl,
      "date":this.date,
      "time":this.time,
      "id":this.id,




    };
  }
  factory Doctorsmodel.fromMap(Map<String,dynamic>map){
    return Doctorsmodel(
      name: map["name"]??"",
      spl: map["spl"]??"",
      date: map["date"]??"",
      time: map["time"]??"",
      id: map["id"]??"",
    );
  }
  Doctorsmodel copyWith({
    String? name,
    String? spl,
    String? date,
    int? time,
    String ?id,


  }){
    return Doctorsmodel(
      name: name ?? this.name,
      spl: spl ?? this.spl,
      date: date ?? this.date,
      time: time ?? this.time,
      id: id ?? this.id


    );
  }



}
class AddressModel {
  String name;
  int phone;
  int pincode;
  String street;
  String city;
  String country;
  String houseName;
  String id;

  AddressModel({
    required this.name,
    required this.phone,
    required this.pincode,
    required this.street,
    required this.city,
    required this.country,
    required this.houseName,
    required this.id,
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
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic>map){
    return AddressModel(
      phone: map['phone'] ?? "",
      pincode: map['pincode'] ?? "",
      street: map['street'] ?? "",
      city: map['city'] ?? "",
      country: map['country'] ?? "",
      houseName: map['houseName'] ?? "",
      name: map['name'] ?? "",
      id: map['id'] ?? "",
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
    );
  }
}
