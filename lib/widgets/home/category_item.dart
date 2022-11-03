import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../constant.dart';
import '../../models/category.dart';
import '../../screens/food_detail_screen.dart';

class CategoryItem extends StatelessWidget {
  final Results data;

  const CategoryItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FoodDetailScreen(
                id: data.key!,
                imageUrl: data.thumb!,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: deviceSize.height * 0.25,
              width: deviceSize.width - 32,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: data.thumb!,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) {
                    return Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(kPrimaryColor),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              data.title!,
              style: kSecondaryTitle,
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
                      data.serving!,
                      style: kSecondaryMediumNormal,
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
                      style: kSecondaryMediumNormal,
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
                      style: kSecondaryMediumNormal,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
