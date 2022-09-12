import 'package:flutter/material.dart';
import 'package:login_page/home.dart';
import 'package:login_page/login.dart';
import 'package:login_page/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash1 extends StatefulWidget {
  const ScreenSplash1({Key? key}) : super(key: key);

  @override
  State<ScreenSplash1> createState() => _ScreenSplash1State();
}

class _ScreenSplash1State extends State<ScreenSplash1> {
  @override
  void initState() {
    cheackUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 500,
            child: Image.asset(
              'lib/assets/image/logo.jpg',
              width: 200,
            ),
          ),
        ],
      )),
    );
  }

  Future<void> gotologin() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ScreenLogin(),
      ),
    );
  }

  Future<void> cheackUserLoggedIn() async {
    final _sharedprefs = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedprefs.getBool(saveKeyValue);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      gotologin();
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx1) => const ScreenHome()));
    }
  }
}
