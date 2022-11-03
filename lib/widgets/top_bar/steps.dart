import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../models/food_detail.dart';

class Steps extends StatelessWidget {
  final Results data;

  const Steps({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 100 * data.step!.length.toDouble(),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.step!.length,
              itemBuilder: (context, index) {
                return Text(
                  data.step![index],
                  style: kSecondaryRegularNormal.copyWith(
                    fontSize: 16,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
