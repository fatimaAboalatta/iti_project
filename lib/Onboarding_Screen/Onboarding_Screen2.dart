import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:project_iti/Onboarding_Screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onbordingscreen extends StatefulWidget {
  const Onbordingscreen({Key? key}) : super(key: key);

  @override
  State<Onbordingscreen> createState() => _OnbordingscreenState();
}

class _OnbordingscreenState extends State<Onbordingscreen> {
  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'تطبيق بطيخة',
      body: ' ازيكم في أول تطبيق لبيع البطيخ الساقع  ',
      image: Center(
        child: Image.asset(
          'assets/images/b2.png',
        ),
      ),
      decoration: const PageDecoration(
          imageFlex: 1,
          titleTextStyle: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          )),
    ),
    PageViewModel(
      title: 'تطبيق بطيخة',
      body:
          'بيساعدك انك تختار البطيخة الي تعجبك من وانت في بيتك هتشوف شكل البطيخة و هنطبل لك عليها كمان و هنوصلها لحد عندك',
      footer: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF009B62), // Background color
        ),
        child: const Text("يلا بينا "),
      ),
      image: Center(
        child: Image.asset('assets/images/b1.png'),
      ),
      decoration: const PageDecoration(
        imageFlex: 2,
        bodyFlex: 3,
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
        bodyTextStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF009B62),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(27, 10),
            color: Color(0xFF009B62),
            activeSize: Size.square(20),
            activeColor: Colors.red,
          ),
          showDoneButton: true,
          done: const Text(
            'تم',
            style: TextStyle(fontSize: 20, color: Color(0xFF009B62)),
          ),
          showSkipButton: true,
          skip: const Text(
            'تخطي',
            style: TextStyle(fontSize: 20, color: Color(0xFF009B62)),
          ),
          showNextButton: true,
          next: const Icon(
            Icons.arrow_forward,
            size: 30,
            color: Color(0xFF009B62),
          ),
          onDone: () => onDone(context),
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
   await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) =>  Login()));
  }
}
