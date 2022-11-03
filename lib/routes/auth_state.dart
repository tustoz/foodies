import 'package:flutter/material.dart';
import 'package:foodies/screens/home_screen.dart';

import '../screens/login_screen.dart';
import '../services/auth_service.dart';

class AuthState extends StatefulWidget {
  const AuthState({Key? key}) : super(key: key);

  @override
  State<AuthState> createState() => _AuthStateState();
}

class _AuthStateState extends State<AuthState> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
