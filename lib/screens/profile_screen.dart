import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constant.dart';
import '../services/auth_service.dart';
import '../widgets/custom_scroll_behavior.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut(context) async {
    await Auth().signOut();
    final route = MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    );
    Navigator.of(context).pushReplacement(route);
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return ScrollConfiguration(
      behavior: CustomScroll(),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 25,
                left: 25,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 32,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    user?.photoURL != null
                        ? ClipOval(
                            child: SizedBox(
                              height: screen.height * 0.18,
                              width: screen.height * 0.18,
                              child: Image.network(
                                user!.photoURL!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : ClipOval(
                            child: SizedBox(
                              height: screen.height * 0.18,
                              width: screen.height * 0.18,
                              child: Image.asset(
                                'assets/images/profile.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                    const SizedBox(height: 15),
                    Text(
                      user?.displayName ?? 'anonymous',
                      style: kSecondaryTitle.copyWith(fontFamily: 'Avenir'),
                    ),
                    const SizedBox(height: 5),
                    Text(user?.uid ?? 'anonymous'),
                    Text(user?.email ?? 'anonymous'),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () {
                        signOut(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 10,
                        ),
                      ),
                      child: const Text('Sign Out'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
