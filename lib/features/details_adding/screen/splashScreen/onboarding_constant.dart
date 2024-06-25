import '../../../../core/constants/images.dart';

class UnboardingConstant{
  String image;
  String discription;
  String discription2;
  UnboardingConstant({required this.image,required this.discription,required this.discription2});
}
List<UnboardingConstant> constants=[
  UnboardingConstant(

    image: ImagePictures.doc1,
    discription:"Consult only with a doctor",
    discription2:"you trust",
  ),
  UnboardingConstant(

    image:ImagePictures.doc2,
    discription:"Find a lot of specialist",
    discription2:"doctors in one place",
  ),
  UnboardingConstant(

    image: ImagePictures.doc3,
    discription:"Get connect our Online",
    discription2:"Consultation",
  ),
];