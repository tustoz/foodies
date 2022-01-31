import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodies/constants.dart';
import 'package:foodies/screens/article.dart';
import 'package:foodies/screens/home.dart';
import 'package:foodies/screens/search.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  final List<Widget> _page = const [
    HomeScreen(),
    ArticleScreen(),
    SearchScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedFontSize: 12,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/home.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: kPrimaryColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/heart.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/heart.svg',
              color: kPrimaryColor,
            ),
            label: 'Article',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/search.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/search.svg',
              color: kPrimaryColor,
            ),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
