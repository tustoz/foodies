// ignore_for_file: non_constant_identifier_names, unused_field, prefer_final_fields, unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodies/components/category_list.dart';

import 'package:foodies/components/bottom_bar.dart';

import 'package:foodies/screens/search.dart';
import 'package:foodies/utils/services.dart';
import 'package:foodies/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  String query = '';

  List<String> cat = [
    'resep-dessert',
    'masakan-hari-raya',
    'masakan-tradisional',
    'makan-malam',
    'makan-siang',
    'resep-ayam',
    'resep-daging',
    'resep-sayuran',
    'resep-seafood',
    'sarapan',
  ];

  int selectedIndex = 0;
  List<String> category = [
    'Dessert',
    'Masakan Hari Raya',
    'Masakan Tradisional',
    'Menu Makan Malam',
    'Menu Makan Siang',
    'Resep Ayam',
    'Resep Daging',
    'Resep Sayuran',
    'Resep Seafood',
    'Sarapan'
  ];

  Widget _buildChips() {
    List<Widget> chips = [];

    for (int i = 0; i < category.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: selectedIndex == i,
        label: Text(
          category[i],
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
          return Wrap(
            spacing: 10,
            children: chips,
          );
        },
      ),
    );
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   children: chips,
    // );
  }

  randomize() {
    return Random().nextInt(cat.length);
  }

  Widget categorySection() {
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
  void initState() {
    int i = randomize();
    futureCategory = fetchCategory(cat[selectedIndex]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RefreshIndicator(
            color: kPrimaryColor,
            onRefresh: () {
              return Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const BottomBar(),
                ),
              );
            },
            child: ListView(
              children: [
                const SizedBox(height: 30),
                Text(
                  'What do you want\nto cook today?',
                  style: kPrimaryTitle.copyWith(height: 1.1),
                ),
                const SizedBox(height: 17),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: deviceSize.height * 0.06,
                      width: deviceSize.width * 0.75,
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
                        borderRadius:
                            BorderRadius.circular(deviceSize.width / 2),
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
                          hintText: 'Masakan hari raya',
                          hintStyle: kPrimarySubtitle.apply(color: kShadeColor),
                          icon:
                              SvgPicture.asset('assets/icons/search-lens.svg'),
                        ),
                      ),
                    ),
                    SvgPicture.asset('assets/icons/filter.svg'),
                    const SizedBox(),
                  ],
                ),
                const SizedBox(height: 16),
                _buildChips(),
                const SizedBox(height: 16),
                categorySection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
