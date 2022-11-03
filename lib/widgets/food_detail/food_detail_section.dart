import 'package:flutter/material.dart';
import 'package:foodies/models/food_detail.dart';

import '../../constant.dart';
import 'food_detail_item.dart';

class FoodDetailSection extends StatelessWidget {
  final Future<FoodDetail> future;
  final String imageUrl;

  const FoodDetailSection(
      {Key? key, required this.future, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return FutureBuilder<FoodDetail>(
      future: future,
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
          return FoodDetailItem(data: data, imageUrl: imageUrl);
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
    );
  }
}
