import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:foodies/screens/article_detail.dart';
import 'package:foodies/models/article.dart';

import '../../constants.dart';

class ArticleItem extends StatelessWidget {
  final Results data;

  const ArticleItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ArticleDetailScreen(
                tag: data.tags.toString(),
                id: data.key.toString(),
                imageUrl: data.thumb.toString(),
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: deviceSize.height * 0.2,
              width: deviceSize.width * 0.55,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: data.thumb.toString(),
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) {
                    return Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(kSecondaryColor),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: deviceSize.width * 0.55,
              child: Text(
                data.title.toString(),
                style: kSecondarySubtitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
