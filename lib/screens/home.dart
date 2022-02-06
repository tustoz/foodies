import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:foodies/components/header.dart';
import 'package:foodies/components/home/category_list.dart';
import 'package:foodies/components/search/search_bar.dart';
import 'package:foodies/components/bottom_bar.dart';

import 'package:foodies/data/category_label.dart';
import 'package:foodies/utils/services.dart';
import 'package:foodies/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    futureCategory = fetchCategory(categoryUrl[selectedIndex]);
    super.initState();
  }

  // build chips list
  Widget _buildChips() {
    List<Widget> chips = [];

    for (int i = 0; i < categoryLabel.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: selectedIndex == i,
        label: Text(
          categoryLabel[i],
          style: selectedIndex == i
              ? kSecondaryMediumNormal.copyWith(color: kSecondaryColor)
              : kSecondaryMediumNormal,
        ),
        elevation: 1,
        pressElevation: 2,
        selectedColor: kBackgroundColor,
        backgroundColor: kBackgroundColor,
        shape: selectedIndex == i
            ? StadiumBorder(
                side: BorderSide(
                  color: kSecondaryColor,
                  width: 0.5,
                ),
              )
            : StadiumBorder(
                side: BorderSide(
                  color: kShadeColor,
                  width: 0.5,
                ),
              ),
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              selectedIndex = i;
            }
          });
        },
      );
      chips.add(choiceChip);
    }
    return SizedBox(
      height: 42,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 1,
        itemBuilder: (context, index) {
          // wrap the list of widget.
          return Wrap(
            spacing: 10,
            children: chips,
          );
        },
      ),
    );
  }

  // category selector based on index.
  Widget _categorySection() {
    switch (selectedIndex) {
      case 0:
        CategoryList(selectedIndex: selectedIndex);
        break;
      case 1:
        CategoryList(selectedIndex: selectedIndex);
        break;
      case 2:
        CategoryList(selectedIndex: selectedIndex);
        break;
      case 3:
        CategoryList(selectedIndex: selectedIndex);
        break;
      case 4:
        CategoryList(selectedIndex: selectedIndex);
        break;
      case 5:
        CategoryList(selectedIndex: selectedIndex);
        break;
      case 6:
        CategoryList(selectedIndex: selectedIndex);
        break;
      case 7:
        CategoryList(selectedIndex: selectedIndex);
        break;
      case 8:
        CategoryList(selectedIndex: selectedIndex);
        break;
      case 9:
        CategoryList(selectedIndex: selectedIndex);
        break;
      default:
        CategoryList(selectedIndex: 0);
    }
    return CategoryList(selectedIndex: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          // Pull to refresh the page
          child: RefreshIndicator(
            color: kPrimaryColor,
            // Callback this page.
            onRefresh: () {
              return Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const BottomBar(),
                ),
              );
            },
            child: ListView(
              children: [
                // Text Header
                const Header(
                    title: 'Temukan Beragam Resep\nOlahan Lezat & Menarik'),
                // Search Bar & Filter Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SearchBar(),
                    GestureDetector(
                      onTap: () {
                        const snackBar = SnackBar(
                          content: Text('Fitur Belum Tersedia!'),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: SvgPicture.asset('assets/icons/filter.svg'),
                    ),
                    const SizedBox(),
                  ],
                ),
                const SizedBox(height: 16),
                // Chips selector
                _buildChips(),
                const SizedBox(height: 16),
                // Show recipes based on the requested category.
                _categorySection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
