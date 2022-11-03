import 'package:flutter/material.dart';

import '../constant.dart';
import '../services/core_service.dart';
import '../widgets/custom_scroll_behavior.dart';
import '../widgets/search/search_bar.dart';
import '../widgets/search/search_result.dart';

class SearchScreen extends StatefulWidget {
  final String? query;

  const SearchScreen({Key? key, this.query}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    futureSearchFood = fetchSearchFood(widget.query!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: CustomScroll(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 35),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: kTextColor,
                        size: 32,
                      ),
                    ),
                    const SearchBar(),
                  ],
                ),
                const SizedBox(height: 25),
                const SearchResult(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
