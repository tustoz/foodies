import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant.dart';
import '../../data/category_label.dart';
import '../../screens/search_screen.dart';
import '../../services/core_service.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Container(
      height: deviceSize.height * 0.06,
      width: deviceSize.width * 0.75,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: kShadeColor.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 1),
          )
        ],
        color: const Color(0xffF7F6F6),
        borderRadius: BorderRadius.circular(deviceSize.width / 2),
      ),
      child: TextField(
        controller: searchController,
        onSubmitted: (value) {
          setState(() {
            query = value;
          });
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SearchScreen(query: query),
            ),
          );
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: categoryLabel[randomize(categoryLabel)],
          hintStyle:
              kSecondarySubtitle.apply(color: kTextColor.withOpacity(.5)),
          icon: SvgPicture.asset('assets/icons/search-lens.svg'),
        ),
      ),
    );
  }
}
