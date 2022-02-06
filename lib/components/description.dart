import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodies/models/food_detail.dart';

import '../constants.dart';

class Description extends StatelessWidget {
  final Results data;

  const Description({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            data.title.toString(),
            style: kSecondaryTitle.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/icons/heart.svg'),
                  const SizedBox(width: 10),
                  Text(
                    data.servings.toString(),
                    style: kSecondaryRegularNormal,
                  ),
                ],
              ),
              const SizedBox(width: 15),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/time.svg'),
                  const SizedBox(width: 10),
                  Text(
                    data.times.toString(),
                    style: kSecondaryRegularNormal,
                  ),
                ],
              ),
              const SizedBox(width: 15),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/fire.svg'),
                  const SizedBox(width: 10),
                  Text(
                    data.dificulty.toString(),
                    style: kSecondaryRegularNormal,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.author!.user.toString(),
                style: kSecondaryMediumNormal.copyWith(
                  fontSize: 16,
                  color: kTextColor,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                data.author!.datePublished.toString(),
                style: kSecondaryMediumNormal.copyWith(
                  fontSize: 16,
                  color: kTextColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Flexible(
            child: Text(
              data.desc!.toString(),
              style: kSecondaryRegularNormal.copyWith(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
