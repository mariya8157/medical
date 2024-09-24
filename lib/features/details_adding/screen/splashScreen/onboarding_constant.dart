import '../../../../core/constants/images.dart';

class OnboardingConstant {
  String image;
  String discription;
  String discription2;

  OnboardingConstant(
      {required this.image,
      required this.discription,
      required this.discription2});
}

List<OnboardingConstant> constants = [
  OnboardingConstant(
    image: ImagePictures.doc1,
    discription: "Consult only with a doctor",
    discription2: "you trust",
  ),
  OnboardingConstant(
    image: ImagePictures.doc2,
    discription: "Find a lot of specialist",
    discription2: "doctors in one place",
  ),
  OnboardingConstant(
    image: ImagePictures.doc3,
    discription: "Get connect our Online",
    discription2: "Consultation",
  ),
];
