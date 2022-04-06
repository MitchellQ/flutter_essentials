import 'package:flutter/material.dart';
import 'package:flutter_essentials/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/home_page.dart';
import 'pages/home_page_with_fb.dart';
import 'pages/home_page_with_sb.dart';
import 'pages/login_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Constants.prefs?.getBool("loggedIn") == true
            ? const HomePageSb()
            : const LoginPage(),
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        routes: {
          LoginPage.routeName: ((context) => const LoginPage()),
          HomePage.routeName: ((context) => const HomePage()),
        });
  }
}
