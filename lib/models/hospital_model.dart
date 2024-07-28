class HospitalModel{
  String image;
  String text;
  String id;

  HospitalModel({
    required this.image,
    required this.text,
    required this.id
});

  Map<String,dynamic> toMap(){
    return{
      'image':this.image,
      'text':this.text,
      'id':this.id
    };
  }
  factory HospitalModel.fromMap(Map<String,dynamic>map){
    return HospitalModel(
        image: map['image']??"",
        text: map['text']??"",
      id: map['id']??""
    );
  }
  HospitalModel copyWith({
    String? image,
    String? text,
    String? id

  })
  {
    return HospitalModel(
        image:  image ?? this.image,
        text: text ?? this.text,
      id: id ?? this.id
    );
  }
}