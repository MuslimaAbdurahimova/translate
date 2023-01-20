import 'package:flutter/material.dart';
import 'package:translate/pages/GeneralPage.dart';
import '../../Style/style.dart';


// ignore: must_be_immutable
class OnBoardingPage extends StatefulWidget {
  bool isChangeTheme;

  OnBoardingPage({Key? key, this.isChangeTheme = false}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int index = 0;

  @override
  void initState() {
    goNavigator();
    super.initState();
  }

  goNavigator() {
    if (index == 0) {
      Future.delayed(const Duration(seconds: 3), () {
        index = 1;
        setState(() {});
        goNavigator();
      });
    } else if (index == 1) {
      Future.delayed(const Duration(seconds: 3), () {
        index = 2;
        setState(() {});
        goNavigator();
      });
    } else if (index == 2) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) =>
                    GeneralPage(isChangeTheme: widget.isChangeTheme)),
            (route) => false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  "assets/images/${widget.isChangeTheme ? 'Dark' : 'Light'}.png"),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 150, bottom: 150, left: 70, right: 70),
            child: Image.asset(
                "assets/images/logo${widget.isChangeTheme ? "Dark" : ""}.png"),
          ),
          SizedBox(
            height: 385,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
                    height: 365,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).hintColor,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 155,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Center(
                            child: Text(
                              "Welcome",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    fontSize: 18,
                                  ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                              "Translate with written, voice, mutual talk or drawing in all languages!",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline4),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: Container(
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: Style.primaryGradient),
                            child: TextButton(
                              onPressed: () {
                                index < 3 ? index += 1 : index;
                                if (index == 3) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => GeneralPage(
                                              isChangeTheme:
                                                  widget.isChangeTheme)),
                                      (route) => false);
                                }
                                setState(() {});
                              },
                              child: const Text(
                                "Continue",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 168,
                  child: Center(
                      child: Image.asset(
                          "assets/images/${index == 0 ? 'Image' : index == 1 ? 'Image1' : 'Image2'}.png")),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
