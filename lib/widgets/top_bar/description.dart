import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant.dart';
import '../../models/food_detail.dart';

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
            data.title!,
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
                    data.servings!,
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
                    data.times!,
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
                    data.difficulty!,
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
                'Penulis: ${data.author!.user!}',
                style: kSecondaryMediumNormal.copyWith(
                  fontSize: 16,
                  color: kTextColor,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                data.author!.datePublished!,
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
              data.desc!,
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
