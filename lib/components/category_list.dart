// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodies/models/category.dart';
import 'package:foodies/screens/food_detail.dart';
import 'package:foodies/utils/services.dart';

import '../constants.dart';

class CategoryList extends StatefulWidget {
  int? selectedIndex;
  CategoryList({Key? key, this.selectedIndex}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
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

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return FutureBuilder<Category>(
      future: fetchCategory(cat[widget.selectedIndex!.toInt()]),
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
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FoodDetailScreen(
                            id: data.key!.toString(),
                            imageUrl: data.thumb!.toString(),
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: deviceSize.height * 0.2,
                          width: deviceSize.width - 32,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              imageUrl: data.thumb.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          data.title.toString(),
                          style: kSecondaryTitle,
                        ),
                        const SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/heart.svg'),
                                const SizedBox(width: 10),
                                Text(
                                  data.portion.toString(),
                                  style: kSecondaryMediumNormal,
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/time.svg'),
                                const SizedBox(width: 10),
                                Text(
                                  data.times.toString(),
                                  style: kSecondaryMediumNormal,
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/fire.svg'),
                                const SizedBox(width: 10),
                                Text(
                                  data.dificulty.toString(),
                                  style: kSecondaryMediumNormal,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
        return SizedBox(
          height: deviceSize.height * 0.6,
          width: deviceSize.width,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
            ),
          ),
        );
      },
    );
  }
}
