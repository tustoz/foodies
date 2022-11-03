import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodies/constant.dart';

import '../routes/auth_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
    var duration = const Duration(seconds: 1);
    return Timer(duration, checkUserAuth);
  }

  Future checkUserAuth() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AuthState()),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/soup.png', scale: 1.6),
            SizedBox(width: screen.width * .03),
            Text(
              'Foodies',
              style: kPrimaryHeader.copyWith(
                color: kPrimaryColor,
                fontFamily: 'Avenir',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
