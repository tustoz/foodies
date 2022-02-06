// ignore: unused_import
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Header extends StatelessWidget {
  final String title;

  const Header({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Text(
          title,
          style: kPrimaryTitle.copyWith(height: 1.1),
        ),
        const SizedBox(height: 17),
      ],
    );
  }
}
