import 'package:flutter/material.dart';

import 'package:foodies/components/description.dart';
import 'package:foodies/components/ingredients.dart';
import 'package:foodies/components/step.dart';
import 'package:foodies/constants.dart';
import 'package:foodies/models/food_detail.dart';

class TopBar extends StatefulWidget {
  final Results data;

  const TopBar({Key? key, required this.data}) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    List<Widget> _page = [
      Description(data: widget.data),
      Ingredients(data: widget.data),
      Steps(data: widget.data)
    ];

    int _selectedIndex = 0;

    TabController _tabController = TabController(
        length: _page.length, vsync: this, initialIndex: _selectedIndex);

    return Column(
      children: [
        TabBar(
          controller: _tabController,
          onTap: (value) {
            _selectedIndex = value;
          },
          isScrollable: true,
          indicatorColor: kSecondaryColor,
          labelColor: kSecondaryColor,
          unselectedLabelColor: kTextColor,
          tabs: const <Widget>[
            Tab(
              text: 'Deskripsi',
            ),
            Tab(
              text: 'Bahan - Bahan',
            ),
            Tab(
              text: 'Cara Memasak',
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: _page,
          ),
        ),
      ],
    );
  }
}
