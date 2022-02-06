import 'package:flutter/material.dart';
import 'package:foodies/components/header.dart';
import 'package:foodies/components/article/article_section.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: const [
              // Text Header
              Header(title: 'Jelajahi beragam\nArtikel menarik'),
              ArticleSection(title: 'Inspirasi Dapur', url: 'inspirasi-dapur'),
              ArticleSection(
                  title: 'Makanan & Gaya Hidup', url: 'makanan-gaya-hidup'),
              ArticleSection(title: 'Tips Masak', url: 'tips-masak'),
            ],
          ),
        ),
      ),
    );
  }
}
