import '../../../../core/constants/images.dart';

class OnboardingConstant {
  String image;
  String description;
  String description2;

  OnboardingConstant(
      {required this.image,
      required this.description,
      required this.description2});
}

List<OnboardingConstant> constants = [
  OnboardingConstant(
    image: ImagePictures.doc1,
    description: "Consult only with a doctor",
    description2: "you trust",
  ),
  OnboardingConstant(
    image: ImagePictures.doc2,
    description: "Find a lot of specialist",
    description2: "doctors in one place",
  ),
  OnboardingConstant(
    image: ImagePictures.doc3,
    description: "Get connect our Online",
    description2: "Consultation",
  ),
];
