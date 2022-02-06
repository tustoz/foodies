import 'package:flutter/material.dart';
import 'package:foodies/components/article/article_item.dart';
import 'package:foodies/models/article.dart';
import 'package:foodies/utils/services.dart';

import '../../constants.dart';

class ArticleSection extends StatefulWidget {
  final String title;
  final String url;

  const ArticleSection({Key? key, required this.title, required this.url})
      : super(key: key);

  @override
  _ArticleSectionState createState() => _ArticleSectionState();
}

class _ArticleSectionState extends State<ArticleSection> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(widget.title, style: kPrimaryTitle.copyWith(fontSize: 18)),
        const SizedBox(height: 10),
        FutureBuilder<Article>(
          future: fetchArticle(widget.url),
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
              return SizedBox(
                height: (deviceSize.height * 0.29),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.results!.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.results![index];
                    return ArticleItem(data: data);
                  },
                ),
              );
            }
            return SizedBox(
              height: deviceSize.height * 0.29,
              width: deviceSize.width,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(kSecondaryColor),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
