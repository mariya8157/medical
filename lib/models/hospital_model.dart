class HospitalModel{
  String image;
  String text;

  HospitalModel({
    required this.image,
    required this.text
});

  Map<String,dynamic> toMap(){
    return{
      'image':this.image,
      'text':this.text
    };
  }
  factory HospitalModel.fromMap(Map<String,dynamic>map){
    return HospitalModel(
        image: map['image']??"",
        text: map['text']??"",
    );
  }
  HospitalModel copyWith({
    String? image,
    String? text,

  })
  {
    return HospitalModel(
        image:  image ?? this.image,
        text: text ?? this.text
    );
  }
}