import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:foodies/components/bottom_bar.dart';
import 'package:foodies/constants.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 75, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: Text(
                  'Mau Masak Apa\nHari Ini?',
                  style: kPrimaryHeader.copyWith(height: 1.1),
                ),
              ),
              const SizedBox(height: 5),
              FadeInUp(
                delay: const Duration(milliseconds: 500),
                child: Text(
                  'Semua resep khas indonesia ada disini\ntemukan berbagai resep yang kamu suka',
                  style: kPrimaryNormal,
                ),
              ),
              const SizedBox(height: 40),
              FadeInUp(
                delay: const Duration(milliseconds: 700),
                child: Image.asset(
                  'assets/images/chef.png',
                  scale: 4,
                ),
              ),
              const SizedBox(height: 55),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BottomBar(),
                      ),
                    );
                  },
                  child: FadeInUp(
                    delay: const Duration(milliseconds: 900),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: deviceSize.height * 0.07,
                      width: deviceSize.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          deviceSize.width / 2,
                        ),
                        color: kBackgroundColor,
                      ),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: kPrimarySubtitle.apply(
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
