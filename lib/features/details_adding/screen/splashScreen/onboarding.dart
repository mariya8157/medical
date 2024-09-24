import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';
import '../../../../main.dart';
import '../../../../models/user_model.dart';
import '../home/bottomnavigation.dart';
import '../login_signup/login.dart';
import 'getstarted.dart';
import 'onboarding_constant.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  PageController controller = PageController();

  bool login = false;

  Future<UsersModel?> fetchUserData(String userId) async {
    final doc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (doc.exists) {
      return UsersModel.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  keepLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    login = prefs.getBool('login') ?? false;
    userId = prefs.getString('id');
  }

  void loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userIds = await prefs.getString('id');
    if (userIds != null) {
      currentModel = await fetchUserData(userIds);
      print(currentModel?.name);
    }
    // Navigate to the next screen after loading user data
  }

  @override
  void initState() {
    loadUserData();
    keepLogin();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(width * 0.04),
          child: Column(
            children: [
              SizedBox(
                height: width * 1.6,
                width: width * 0.94,
                child: PageView.builder(
                  controller: controller,
                  padEnds: false,
                  itemCount: constants.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return Column(children: [
                      Container(
                        height: width * 1.25,
                        width: width * 1,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(constants[i].image),
                          fit: BoxFit.fill,
                        )),
                      ),
                      SizedBox(
                        height: width * 0.1,
                      ),
                      Row(
                        children: [
                          Text(
                            constants[i].description,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w800,
                              color: Colour.thirdcolour,
                              fontSize: width * 0.06,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            constants[i].description2,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w800,
                              color: Colour.thirdcolour,
                              fontSize: width * 0.06,
                            ),
                          ),
                        ],
                      ),
                    ]);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => Container(
                              height: width * 0.02,
                              width: currentIndex == index
                                  ? width * 0.065
                                  : width * 0.02,
                              margin: EdgeInsets.only(right: width * 0.03),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(width * 0.03),
                                color: currentIndex == index
                                    ? Colour.primarycolour
                                    : Colour.thirdcolour,
                              ),
                            )),
                  ),
                  // currentIndex==3?SizedBox():
                  GestureDetector(
                    onTap: () {
                      controller.jumpToPage(2);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => login == true
                                ? BottomNavigationPage()
                                : GetStartedPage(),
                          ));
                      setState(() {});
                    },
                    child: SvgPicture.asset(ImageIcons.button),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
