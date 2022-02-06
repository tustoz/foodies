import 'package:flutter/material.dart';
import 'package:foodies/components/food_detail/food_detail_section.dart';

import 'package:foodies/utils/services.dart';

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
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            FoodDetailSection(
              future: futureFoodDetails,
              imageUrl: widget.imageUrl,
            ),
          ],
        ),
      ),
    );
  }
}
