import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodies/models/article_detail.dart';

import '../../constants.dart';

class ArticleDetailItem extends StatelessWidget {
  final Results data;
  final String imageUrl;

  const ArticleDetailItem({
    Key? key,
    required this.data,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Hero(
          tag: data.thumb!.toString().isEmpty
              ? imageUrl.toString()
              : data.thumb!.toString(),
          child: SizedBox(
            height: deviceSize.height * 0.33,
            width: deviceSize.width,
            child: data.thumb?.toString() == null
                ? CachedNetworkImage(
                    imageUrl: imageUrl.toString(),
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
                  )
                : CachedNetworkImage(
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
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.title.toString(),
                style: kSecondaryTitle.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.author!.toString(),
                    style: kSecondaryMediumNormal.copyWith(
                      fontSize: 16,
                      color: kTextColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    data.datePublished!.toString(),
                    style: kSecondaryMediumNormal.copyWith(
                      fontSize: 16,
                      color: kTextColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                data.description!.toString(),
                style: kSecondaryRegularNormal.copyWith(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ],
    );
  }
}
