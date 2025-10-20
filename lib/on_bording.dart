import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:logindice/main.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome to Dice App",
          body: "This is a simple dice rolling app.",
          image: Center(
            child: Icon(
              Icons.casino,
              size: 175.0,
              color: Colors.redAccent,
            ),
          ),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
            title: "Roll the Dice",
            body: "Tap the button to roll the dice and see the result.",
            image: Center(
              child: Icon(
                Icons.casino,
                size: 175.0,
                color: Colors.redAccent,
              ),
            ),
            decoration: getPageDecoration()),
        PageViewModel(
            title: "Have Fun!",
            body: "Enjoy playing with the dice app.",
            image: Center(
              child: Icon(
                Icons.casino,
                size: 175.0,
                color: Colors.redAccent,
              ),
            ),
            decoration: getPageDecoration()),
      ],
      showSkipButton: true,
      skip: Text("Skip"),
      next: Icon(Icons.arrow_forward),
      dotsDecorator: DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.grey,
        activeSize: Size(22.0, 10.0),
        activeColor: Colors.redAccent,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      curve: Curves.bounceOut,
      done: Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LogIn()),
        );
      },
    );
  }

  PageDecoration getPageDecoration() {
    return PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 18.0,
      ),
      imagePadding: EdgeInsets.all(24.0),
      pageColor: Colors.white,
    );
  }
}
