import 'package:flutter/material.dart';
import 'package:foodies/components/article_detail/article_detail_item.dart';
import 'package:foodies/models/article_detail.dart';

import '../../constants.dart';

class ArticleDetailSection extends StatelessWidget {
  final Future<ArticleDetail> future;
  final String imageUrl;

  const ArticleDetailSection({
    Key? key,
    required this.future,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return FutureBuilder<ArticleDetail>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('${snapshot.error}'),
            ],
          );
        } else if (snapshot.hasData) {
          var data = snapshot.data!.results!;
          return ArticleDetailItem(data: data, imageUrl: imageUrl);
        }
        return SizedBox(
          height: deviceSize.height,
          width: deviceSize.width,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(kSecondaryColor),
            ),
          ),
        );
      },
    );
  }
}
