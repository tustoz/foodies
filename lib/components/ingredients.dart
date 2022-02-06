import 'package:flutter/material.dart';
import 'package:foodies/models/food_detail.dart';

import '../constants.dart';

class Ingredients extends StatelessWidget {
  final Results data;

  const Ingredients({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 17 * data.ingredient!.length.toDouble(),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.ingredient!.length,
              itemBuilder: (context, index) {
                return Text(
                  '- ' + data.ingredient![index].toString(),
                  style: kSecondaryRegularNormal.copyWith(
                    fontSize: 16,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
