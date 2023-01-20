import 'package:flutter/material.dart';
import 'package:translate/pages/OnBoarding/OnBoardingPage.dart';

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
  bool isActive;
  bool isChangeTheme;

  SplashScreen({Key? key, this.isActive = false, this.isChangeTheme = false})
      : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    if (widget.isActive) {
      getNewPage();
    }
    super.initState();
  }

  getNewPage() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) =>  OnBoardingPage(isChangeTheme: widget.isChangeTheme)),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/${widget.isChangeTheme ? "Dark" : "Light"}.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 75),
        child: Center(
          child: Image.asset(
            "assets/images/logo${widget.isChangeTheme ? "Dark" : ""}.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    ));
  }
}
