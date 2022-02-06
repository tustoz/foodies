import 'package:flutter/material.dart';
import 'package:foodies/components/search/search_item.dart';
import 'package:foodies/models/search_food.dart';
import 'package:foodies/utils/services.dart';

import '../../constants.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  _SearchResultState createState() => _SearchResultState();
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
          return SizedBox(
            height:
                (deviceSize.height * 0.146) * snapshot.data!.results!.length,
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
              valueColor: AlwaysStoppedAnimation<Color>(kSecondaryColor),
            ),
          ),
        );
      },
    );
  }
}
