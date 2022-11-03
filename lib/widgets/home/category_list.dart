import 'package:flutter/material.dart';
import 'package:foodies/data/category_path.dart';
import 'package:foodies/models/category.dart';

import '../../constant.dart';
import '../../services/core_service.dart';
import 'category_item.dart';

class CategoryList extends StatefulWidget {
  final int? selectedIndex;
  const CategoryList({Key? key, this.selectedIndex}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return FutureBuilder<Category>(
      future: fetchCategory(categoryPath[widget.selectedIndex!.toInt()]),
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
          return LimitedBox(
            maxHeight: deviceSize.height * 6,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                var data = snapshot.data!.results![index];
                return CategoryItem(data: data);
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
