import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../top_bar/description.dart';
import '../top_bar/ingridients.dart';
import '../top_bar/steps.dart';

import '../../constant.dart';
import '../../models/food_detail.dart';

class FoodDetailItem extends StatefulWidget {
  final Results data;
  final String imageUrl;

  const FoodDetailItem({Key? key, required this.data, required this.imageUrl})
      : super(key: key);

  @override
  State<FoodDetailItem> createState() => _FoodDetailItemState();
}

class _FoodDetailItemState extends State<FoodDetailItem>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: SizedBox(
        height: deviceSize.height * 1.5,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: deviceSize.height * 0.4,
                  width: deviceSize.width,
                  child: widget.data.thumb!.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: widget.imageUrl,
                          fit: BoxFit.cover,
                        )
                      : CachedNetworkImage(
                          imageUrl: widget.data.thumb!,
                          fit: BoxFit.cover,
                        ),
                ),
                Positioned(
                  top: 15,
                  left: 15,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: deviceSize.width * 0.12,
                      height: deviceSize.width * 0.12,
                      decoration: BoxDecoration(
                        color: kBackgroundColor.withOpacity(0.3),
                        borderRadius: BorderRadius.all(
                          Radius.circular(deviceSize.width * 0.12),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.chevron_left,
                          size: 36,
                          color: kBackgroundColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              // height: 50,
              width: deviceSize.height,
              color: kBackgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TabBar(
                    unselectedLabelColor: kTextColor,
                    labelColor: kSecondaryColor,
                    labelStyle: kSecondaryRegularNormal.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    indicatorColor: kSecondaryColor,
                    indicatorWeight: 2,
                    controller: tabController,
                    tabs: const [
                      Tab(
                        text: 'Deskripsi',
                      ),
                      Tab(
                        text: 'Alat & Bahan',
                      ),
                      Tab(
                        text: 'Langkah',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: TabBarView(
                controller: tabController,
                children: [
                  Description(data: widget.data),
                  Ingredients(data: widget.data),
                  Steps(data: widget.data),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
