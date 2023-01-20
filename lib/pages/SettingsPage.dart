import 'package:flutter/material.dart';
import 'package:translate/store/LocalStore.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25, left: 24, bottom: 25),
          child: Text(
            "Settings",
            style:
                Theme.of(context).textTheme.headline2!.copyWith(fontSize: 30),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).hintColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               TextButton(
                 onPressed: () {  },
                 child: Padding(
                   padding:const EdgeInsets.symmetric(vertical: 9),
                   child: Text(
                     "Feedback",
                     style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 19)),
                 ),
               ),
              Container(
                height: 3,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(13)),
              ),
              TextButton(
                 onPressed: () {  },
                 child: Padding(
                   padding:const EdgeInsets.symmetric(vertical: 9),
                   child: Text(
                     "Help",
                     style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 19)),
                 ),
               ),
              Container(
                height: 3,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(13)),
              ),
              TextButton(
                onPressed: () {  },
                child: Padding(
                  padding:const EdgeInsets.symmetric(vertical: 9),
                  child: Text(
                      "About",
                      style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 19)),
                ),
              ),
              Container(
                height: 3,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(13)),
              ),
              TextButton(
                onPressed: () {  },
                child: Padding(
                  padding:const EdgeInsets.symmetric(vertical: 9),
                  child: Text(
                      "Access To The Microphone",
                      style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 19)),
                ),
              ),
              Container(
                height: 3,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(13)),
              ),
              TextButton(
                onPressed: () {
                  LocalStore.clearAllData();
                },
                child: Padding(
                  padding:const EdgeInsets.symmetric(vertical: 9),
                  child: Text(
                      "Clear All Data",
                      style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 19)),
                ),
              ),

            ],
          ),
        )
      ],
    );
  }
}
