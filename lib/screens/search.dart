import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodies/models/search_food.dart';
import 'package:foodies/screens/food_detail.dart';
import 'package:foodies/utils/services.dart';

import '../constants.dart';

class SearchScreen extends StatefulWidget {
  final String? query;

  const SearchScreen({Key? key, this.query}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  String query = '';

  @override
  void initState() {
    futureSearchFood = fetchSearchFood(widget.query.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 35),
              Container(
                height: deviceSize.height * 0.06,
                width: deviceSize.width * 0.75,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
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
                    hintText: 'Masakan hari raya',
                    hintStyle: kPrimarySubtitle.apply(color: kShadeColor),
                    icon: SvgPicture.asset('assets/icons/search-lens.svg'),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              FutureBuilder<SearchFood>(
                future: futureSearchFood,
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
                      height: (deviceSize.height * 0.146) *
                          snapshot.data!.results!.length,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.results!.length,
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: deviceSize.height * 0.12,
                                    width: deviceSize.width * 0.25,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: CachedNetworkImage(
                                        imageUrl: data.thumb.toString(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: deviceSize.width * 0.55,
                                        child: Text(
                                          data.title.toString(),
                                          style: kSecondaryTitle,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/heart.svg'),
                                              const SizedBox(width: 5),
                                              Text(
                                                data.serving.toString(),
                                                style: kSecondaryThin,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 10),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/time.svg'),
                                              const SizedBox(width: 5),
                                              Text(
                                                data.times.toString(),
                                                style: kSecondaryThin,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 10),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/fire.svg'),
                                              const SizedBox(width: 5),
                                              Text(
                                                data.difficulty.toString(),
                                                style: kSecondaryThin,
                                              ),
                                            ],
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
                        valueColor:
                            AlwaysStoppedAnimation<Color>(kPrimaryColor),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
