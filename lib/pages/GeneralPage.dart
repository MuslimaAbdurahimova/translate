import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:translate/Style/style.dart';
import 'package:translate/pages/FavouritesPage.dart';
import 'package:translate/pages/HistoryPage.dart';
import 'package:translate/pages/HomePage.dart';

import '../main.dart';
import '../store/LocalStore.dart';
import 'SettingsPage.dart';
class GeneralPage extends StatefulWidget {
  final bool isChangeTheme;
  const GeneralPage({super.key, this.isChangeTheme = false,});

  @override
  // ignore: library_private_types_in_public_api
  _GeneralPageState createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  int _selectedIndex = 1;
  bool isChangeTheme = false;
  bool isSetting = false;

  List<Widget> listOfPage = [
    const FavouritePage(),
     const HomePage(),
    const HistoryPage(),
  ];

  @override
  void initState() {
    isChangeTheme = widget.isChangeTheme;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/${isChangeTheme ? "Dark" : "Light"}.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    const Spacer(
                      flex: 10,
                    ),
                    SizedBox(
                        height: 18,
                        child: Image.asset(
                          "assets/images/logo${isChangeTheme ? "Dark" : ""}.png",
                        )),
                    const Spacer(
                      flex: 2,
                    ),
                    IconButton(
                      splashRadius: 28,
                      icon: SizedBox(
                        height: 22,
                        child: Image.asset(
                            "assets/icon/Theme${isChangeTheme ? "Dark" : "Light"}.png"),
                      ),
                      onPressed: () {
                        isChangeTheme = !isChangeTheme;
                        MyApp.of(context)!.change();
                        LocalStore.setTheme(isChangeTheme);
                        setState(() {});
                      },
                    ),
                    const SizedBox(width: 4),
                    IconButton(
                      splashRadius: 28,
                      icon: Icon(
                        Icons.more_horiz,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        isSetting=true;
                        setState(() {});
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              isSetting? const SettingPage() : listOfPage[_selectedIndex]
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MoltenBottomNavigationBar(
        selectedIndex: _selectedIndex,
        domeHeight: 25,
        barColor: Theme.of(context).primaryColor,
        domeCircleColor: Style.primaryColor,
        onTabChange: (clickedIndex) {
          setState(() {
            isSetting=false;
            _selectedIndex = clickedIndex;
          });
        },
        tabs: [
          MoltenTab(
            icon: const Icon(Icons.star_border),
          ),
          MoltenTab(
            icon: const Icon(Icons.home),
          ),
          MoltenTab(
            icon: const Icon(Icons.history),
          ),
        ],
      ),
    );
  }
}
