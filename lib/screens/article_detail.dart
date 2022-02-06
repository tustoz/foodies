import 'package:flutter/material.dart';
import 'package:foodies/components/article_detail/article_detail_section.dart';

import 'package:foodies/utils/services.dart';

class ArticleDetailScreen extends StatefulWidget {
  final String id;
  final String tag;
  final String imageUrl;

  const ArticleDetailScreen({
    Key? key,
    required this.tag,
    required this.id,
    required this.imageUrl,
  }) : super(key: key);

  @override
  _ArticleDetailScreenState createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  @override
  void initState() {
    futureArticleDetail = fetchArticleDetail(widget.tag, widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ArticleDetailSection(
              future: futureArticleDetail,
              imageUrl: widget.imageUrl,
            ),
          ],
        ),
      ),
    );
  }
}
