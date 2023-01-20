import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translate/components/OnFocusTap.dart';
import 'package:translate/model/LanguagesModel.dart';
import 'package:translate/repository/GetInfo.dart';
import 'package:translate/store/LocalStore.dart';
import '../components/Delayed.dart';
import '../model/TranslateModel.dart';

class HomePage extends StatefulWidget {
   const HomePage({Key? key,}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _targetController = TextEditingController();
  final _delayed = Delayed(milliseconds: 700);
  @override
  void initState() {
    getLang();
    super.initState();
  }

  getLang() async {
    isLoading = true;
    setState(() {});
    LanguagesModel? model = await GetInfo.getLanguages();
    model?.data?.languages?.forEach((element) {
      languages.add(element?.name);
      codes.add(element?.code);
    });
    isLoading = false;
    setState(() {});
  }

  List<String?> languages = [];
  List<String?> codes = [];

  getInfo(String text) async {
    _targetController.text = await GetInfo.sendTranslate(TranslateModel(
        sourceLanguage: sourceLanguage,
        targetLanguage: targetLanguage,
        text: text));
    setState(() {});
  }

  String sourceLanguage = 'en';
  String targetLanguage = 'uz';

  String source = 'English';
  String target = 'Uzbek';

  @override
  void dispose() {
    _sourceController.dispose();
    _targetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Expanded(
          child: Center(
              child: CircularProgressIndicator(
              color: Theme.of(context).hintColor,
            )),
        )
        : OnUnFocusTap(
          child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.8,
                        child: DropdownButton(
                          style: Theme.of(context).textTheme.headline3,
                          dropdownColor: Theme.of(context).hintColor,
                          isExpanded: true,
                          value: source,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() => source = newValue);
                            }
                          },
                          items: languages.map((String? items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items ?? ''),
                            );
                          }).toList(),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            String newstr = target;
                            target = source;
                            source = newstr;
                            setState(() {});
                          },
                          icon: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).hintColor.withOpacity(0.3),
                            ),
                            child: Icon(
                              Icons.change_circle_outlined,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          )),
                      const Spacer(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.8,
                        child: DropdownButton(
                          dropdownColor: Theme.of(context).hintColor,
                          style: Theme.of(context).textTheme.headline3,
                          isExpanded: true,
                          value: target,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() => target = newValue);
                            }
                          },
                          items: languages.map((String? items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items ?? ''),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).hintColor,
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (s) {
                          _delayed.run(() async {
                            sourceLanguage =
                                codes[languages.indexOf(source)] ?? 'en';
                            targetLanguage =
                                codes[languages.indexOf(target)] ?? 'uz';
                            getInfo(s);
                            LocalStore.setHistory(TranslateModel(
                                sourceLanguage: sourceLanguage,
                                targetLanguage: targetLanguage,
                                text: _sourceController.text,
                                response: _targetController.text));
                            setState(() {});
                          });

                        },
                        controller: _sourceController,
                        maxLines: 4,
                        minLines: 4,
                        style: Theme.of(context).textTheme.headline3,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).hintColor,
                          hintText: "Type something",
                          hintStyle: Theme.of(context).textTheme.headline3,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none),
                          suffixIcon: Column(
                            children: [
                              IconButton(
                                splashRadius: 24,
                                icon: Icon(
                                  Icons.star_border,
                                  color: Theme.of(context).cardColor,
                                ),
                                onPressed: () {
                                  LocalStore.setFavourites(TranslateModel(
                                      sourceLanguage: sourceLanguage,
                                      targetLanguage: targetLanguage,
                                      text: _sourceController.text,
                                      response: _targetController.text));
                                },
                              ),
                              IconButton(
                                splashRadius: 24,
                                icon: Icon(
                                  Icons.copy,
                                  color: Theme.of(context).cardColor,
                                ),
                                onPressed: () async {
                                  await Clipboard.setData(
                                       ClipboardData(text: _sourceController.text));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: Theme.of(context).cardColor,
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: _targetController,

                        maxLines: 5,
                        minLines: 5,
                        style: Theme.of(context).textTheme.headline3,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).hintColor,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none),
                          suffixIcon: Column(
                            children: [
                              IconButton(
                                splashRadius: 24,
                                icon: Icon(
                                  Icons.star_border,
                                  color: Theme.of(context).cardColor,
                                ),
                                onPressed: () {
                                  LocalStore.setFavourites(TranslateModel(
                                      sourceLanguage: sourceLanguage,
                                      targetLanguage: targetLanguage,
                                      text: _sourceController.text,
                                      response: _targetController.text));
                                },
                              ),
                              IconButton(
                                splashRadius: 24,
                                icon: Icon(
                                  Icons.copy,
                                  color: Theme.of(context).cardColor,
                                ),
                                onPressed: () async {
                                  await Clipboard.setData(ClipboardData(
                                      text: _targetController.text));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        );
  }
}
