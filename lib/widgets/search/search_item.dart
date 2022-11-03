import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../constant.dart';
import '../../models/search_food.dart';
import '../../screens/food_detail_screen.dart';

class SearchItem extends StatelessWidget {
  final Results data;
  const SearchItem({Key? key, required this.data}) : super(key: key);

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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: deviceSize.height * 0.12,
              width: deviceSize.width * 0.25,
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
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: deviceSize.width * 0.62,
                  child: Text(
                    data.title!,
                    style: kSecondaryTitle,
                    softWrap: true,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/heart.svg',
                          width: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          data.serving!,
                          style: kSecondaryThin,
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/time.svg',
                          width: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          data.times!,
                          style: kSecondaryThin,
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/fire.svg',
                          width: 12,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          data.difficulty!,
                          style: kSecondaryThin,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
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
