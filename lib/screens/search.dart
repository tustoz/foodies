import 'package:flutter/material.dart';
import 'package:foodies/components/search/search_bar.dart';
import 'package:foodies/components/search/search_result.dart';
import 'package:foodies/constants.dart';

import 'package:foodies/utils/services.dart';

class SearchScreen extends StatefulWidget {
  final String? query;

  const SearchScreen({Key? key, this.query}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    futureSearchFood = fetchSearchFood(widget.query.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
