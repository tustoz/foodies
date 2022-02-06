// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foodies/components/home/category_item.dart';
import 'package:foodies/models/category.dart';
import 'package:foodies/utils/services.dart';

import '../../constants.dart';

class CategoryList extends StatefulWidget {
  int? selectedIndex;
  CategoryList({Key? key, this.selectedIndex}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<String> categoryUrl = [
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

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return FutureBuilder<Category>(
      future: fetchCategory(categoryUrl[widget.selectedIndex!.toInt()]),
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
            height: deviceSize.height * 3.3,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                var data = snapshot.data!.results![index];
                return CategoryItem(data: data);
              },
            ),
          );
        }
        return SizedBox(
          height: deviceSize.height * 0.6,
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
