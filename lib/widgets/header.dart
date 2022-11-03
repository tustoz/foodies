import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:foodies/screens/profile_screen.dart';

import '../services/auth_service.dart';
import '../constant.dart';

class Header extends StatelessWidget {
  final String title;

  Header({Key? key, required this.title}) : super(key: key);

  final User? user = Auth().currentUser;

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/images/soup.png', scale: 2),
              SizedBox(width: screen.width * .03),
              Text(
                'Foodies',
                style: kPrimaryTitle.copyWith(
                  color: kTextColor,
                  fontFamily: 'Avenir',
                ),
              ),
            ],
          ),
          user?.photoURL != null
              ? GestureDetector(
                  onTap: () {
                    final route = MaterialPageRoute(
                        builder: (context) => ProfileScreen());
                    Navigator.of(context).push(route);
                  },
                  child: ClipOval(
                    child: SizedBox(
                      height: screen.height * .06,
                      width: screen.height * .06,
                      child: Image.network(
                        user!.photoURL!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    final route = MaterialPageRoute(
                        builder: (context) => ProfileScreen());
                    Navigator.of(context).push(route);
                  },
                  child: ClipOval(
                    child: SizedBox(
                      height: screen.height * .06,
                      width: screen.height * .06,
                      child: Image.asset(
                        'assets/images/profile.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
