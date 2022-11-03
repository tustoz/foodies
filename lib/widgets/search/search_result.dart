import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../models/search_food.dart';
import '../../services/core_service.dart';
import 'search_item.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return FutureBuilder<SearchFood>(
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
          return LimitedBox(
            maxHeight:
                (deviceSize.height * 0.17) * snapshot.data!.results!.length,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.results!.length,
              itemBuilder: (context, index) {
                var data = snapshot.data!.results![index];
                return SearchItem(data: data);
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
