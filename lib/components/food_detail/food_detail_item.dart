import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodies/components/description.dart';
import 'package:foodies/components/ingredients.dart';
import 'package:foodies/components/step.dart';
import 'package:foodies/constants.dart';
import 'package:foodies/models/food_detail.dart';

class FoodDetailItem extends StatefulWidget {
  final Results data;
  final String imageUrl;

  const FoodDetailItem({Key? key, required this.data, required this.imageUrl})
      : super(key: key);

  @override
  _FoodDetailItemState createState() => _FoodDetailItemState();
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
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              height: deviceSize.height * 0.3,
              width: deviceSize.width,
              child: widget.data.thumb?.toString() == null
                  ? CachedNetworkImage(
                      imageUrl: widget.imageUrl.toString(),
                      fit: BoxFit.cover,
                    )
                  : CachedNetworkImage(
                      imageUrl: widget.data.thumb.toString(),
                      fit: BoxFit.cover,
                    ),
            ),
            Container(
              // height: 50,
              width: MediaQuery.of(context).size.height,
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
                        text: 'Cara Pembuatan',
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
