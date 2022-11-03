import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies/screens/home_screen.dart';

import '../constant.dart';
import '../services/auth_service.dart';
import '../widgets/border_style.dart';
import '../widgets/custom_scroll_behavior.dart';
import '../widgets/social_button.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? errorMessage;

  Future<void> createUserWithEmailAndPassword(context) async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      final route = MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
      Navigator.of(context).pushReplacement(route);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
      final errorSnackbar = SnackBar(
        content: Text(errorMessage!),
        backgroundColor: Theme.of(context).errorColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(errorSnackbar);
    }
  }

  Future<void> signInWithGoogle(context) async {
    try {
      await Auth().signInWithGoogle();
      final route = MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
      Navigator.of(context).pushReplacement(route);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
      final errorSnackbar = SnackBar(
        content: Text(errorMessage!),
        backgroundColor: Theme.of(context).errorColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(errorSnackbar);
    }
  }

  Future<void> signInWithFacebook(context) async {
    try {
      await Auth().signInWithFacebook();
      final route = MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
      Navigator.of(context).pushReplacement(route);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
      final errorSnackbar = SnackBar(
        content: Text(errorMessage!),
        backgroundColor: Theme.of(context).errorColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(errorSnackbar);
    }
  }

  Future<void> signInWithGithub(context) async {
    try {
      await Auth().signInWithGithub(context);
      final route = MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
      Navigator.of(context).pushReplacement(route);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
      final errorSnackbar = SnackBar(
        content: Text(errorMessage!),
        backgroundColor: Theme.of(context).errorColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(errorSnackbar);
    }
  }

  // Future<void> signInWithTwitter() async {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return ScrollConfiguration(
      behavior: CustomScroll(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/soup.png', scale: 1.6),
                    SizedBox(width: screen.width * .03),
                    Text(
                      'Foodies',
                      style: kPrimaryHeader.copyWith(
                        color: kTextColor,
                        fontFamily: 'Avenir',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screen.height * .03),
                Text(
                  'Mau masak apa hari ini? Dapatkan\nmenu masakan sesuai selera anda!',
                  style: kSecondaryRegularNormal.copyWith(
                    color: kTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screen.height * .025),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kShadeColor,
                    labelText: 'Email',
                    border: borderStyle(),
                    enabledBorder: borderStyle(),
                    focusedBorder: borderStyle(),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                SizedBox(height: screen.height * .015),
                TextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kShadeColor,
                    labelText: 'Password',
                    border: borderStyle(),
                    enabledBorder: borderStyle(),
                    focusedBorder: borderStyle(),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                SizedBox(height: screen.height * .025),
                InkWell(
                  onTap: () {
                    const snackBar = SnackBar(
                      content:
                          Text('pastikan email dan password telah terisi!'),
                    );

                    _emailController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty
                        ? createUserWithEmailAndPassword(context)
                        : ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Container(
                    width: screen.width,
                    height: screen.height * 0.07,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Center(
                      child: Text(
                        'Mendaftar',
                        style:
                            kPrimarySubtitle.copyWith(color: kBackgroundColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screen.height * .015),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "sudah punya akun? ",
                        style:
                            kSecondaryRegularNormal.copyWith(color: kTextColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          final route = MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          );
                          Navigator.of(context).pushReplacement(route);
                        },
                        child: Text(
                          'masuk disini',
                          style: kSecondaryRegularNormal.copyWith(
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screen.height * .15),
                const Text('Atau mendaftar dengan'),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        signInWithGoogle(context);
                      },
                      child: socialMediaButton(
                        icon: 'assets/images/icon-google.png',
                        scale: screen.width,
                      ),
                    ),
                    SizedBox(width: screen.width * .04),
                    GestureDetector(
                      onTap: () {
                        signInWithFacebook(context);
                      },
                      child: socialMediaButton(
                        icon: 'assets/images/icon-facebook.png',
                        scale: screen.width,
                      ),
                    ),
                    SizedBox(width: screen.width * .04),
                    GestureDetector(
                      onTap: () {
                        signInWithGithub(context);
                      },
                      child: socialMediaButton(
                        icon: 'assets/images/icon-github.png',
                        scale: screen.width,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
