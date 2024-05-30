import 'package:clone_gpt/authentication/registration.dart';
import 'package:clone_gpt/main_screnn/home_screen.dart';
import 'package:clone_gpt/provider/theme_provider.dart';
import 'package:clone_gpt/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MyThemeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }

  void getCurrentTheme() async {
    await Provider.of<MyThemeProvider>(context, listen: false)
        .getThemesStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
      return MaterialApp(
        title: 'Clone ChatGPT',
        debugShowCheckedModeBanner: false,
        theme:
            MyTheme.themeData(isDarkTheme: value.themeType, context: context),
        home: const RegistrationScreen(),
      );
    });
  }
}
