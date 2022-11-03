import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant.dart';
import '../data/category_label.dart';
import '../data/category_path.dart';

import '../services/core_service.dart';

import '../widgets/custom_scroll_behavior.dart';
import '../widgets/header.dart';
import '../widgets/home/category_list.dart';
import '../widgets/search/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    futureCategory = fetchCategory(categoryPath[selectedIndex]);
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
              ? kSecondaryMediumNormal.copyWith(color: kBackgroundColor)
              : kSecondaryMediumNormal.copyWith(color: kPrimaryColor),
        ),
        elevation: 1,
        pressElevation: 2,
        selectedColor: kPrimaryColor,
        backgroundColor: kBackgroundColor,
        shape: selectedIndex == i
            ? StadiumBorder(
                side: BorderSide(
                  color: kPrimaryColor,
                  width: 0.5,
                ),
              )
            : StadiumBorder(
                side: BorderSide(
                  color: kPrimaryColor,
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
        const CategoryList(selectedIndex: 0);
    }
    return CategoryList(selectedIndex: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return ScrollConfiguration(
      behavior: CustomScroll(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: deviceSize.width * .04),
            // Pull to refresh the page
            child: RefreshIndicator(
              color: kPrimaryColor,
              // Callback this page.
              onRefresh: () {
                return Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: ListView(
                children: [
                  Header(title: 'Foodies'),
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
      ),
    );
  }
}
