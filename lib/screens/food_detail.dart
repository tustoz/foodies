import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:foodies/utils/services.dart';
import 'package:foodies/models/food_detail.dart';
import 'package:readmore/readmore.dart';

import '../constants.dart';

class FoodDetailScreen extends StatefulWidget {
  final String id;
  final String imageUrl;

  const FoodDetailScreen({
    Key? key,
    required this.id,
    required this.imageUrl,
  }) : super(key: key);

  @override
  _FoodDetailScreenState createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  @override
  void initState() {
    futureFoodDetails = fetchFoodDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            FutureBuilder<FoodDetail>(
              future: futureFoodDetails,
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
                  var data = snapshot.data!.results!;
                  return Column(
                    children: [
                      SizedBox(
                        height: deviceSize.height * 0.3,
                        width: deviceSize.width,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          child: data.thumb?.toString() == null
                              ? CachedNetworkImage(
                                  imageUrl: widget.imageUrl.toString(),
                                  fit: BoxFit.cover,
                                )
                              : CachedNetworkImage(
                                  imageUrl: data.thumb.toString(),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.title.toString(),
                              style: kSecondaryTitle,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.author!.user.toString(),
                                  style: kSecondaryMediumNormal.apply(
                                    color: kTextColor,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  data.author!.datePublished.toString(),
                                  style: kSecondaryMediumNormal.apply(
                                    color: kTextColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            ReadMoreText(
                              data.desc!.toString(),
                              style: kSecondaryMediumNormal,
                              trimLines: 3,
                              colorClickableText: kSecondaryColor,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Selengkapnya',
                              trimExpandedText: 'Lebih Sedikit',
                              moreStyle: kSecondaryMediumNormal.copyWith(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
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
                                      data.servings.toString(),
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
                            const SizedBox(height: 20),
                            Text(
                              'Bahan - Bahan',
                              style: kSecondarySubtitle,
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 14.5 * data.ingredient!.length.toDouble(),
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: data.ingredient!.length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    '- ' + data.ingredient![index].toString(),
                                    style: kSecondaryRegularNormal,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Cara Pembuatan',
                              style: kSecondarySubtitle,
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 40 * data.step!.length.toDouble(),
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: data.step!.length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    data.step![index].toString(),
                                    style: kSecondaryRegularNormal,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return SizedBox(
                  height: deviceSize.height,
                  width: deviceSize.width,
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
