import 'package:flutter/material.dart';

import '../services/core_service.dart';
import '../widgets/custom_scroll_behavior.dart';
import '../widgets/food_detail/food_detail_section.dart';

class FoodDetailScreen extends StatefulWidget {
  final String id;
  final String imageUrl;

  const FoodDetailScreen({
    Key? key,
    required this.id,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  @override
  void initState() {
    futureFoodDetails = fetchFoodDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: CustomScroll(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: [
              FoodDetailSection(
                future: futureFoodDetails,
                imageUrl: widget.imageUrl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
