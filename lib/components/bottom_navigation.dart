// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key, this.selectedPage}) : super(key: key);

  final String? selectedPage;

  @override
  Widget build(BuildContext context) {
    const highlightedIconBackgroundColor = Color(0xFF1a76c0);
    const double highlightedIconWidth = 50;
    const double highlightedIconHeight = 50;
    const double highlightedIconBorderRadius = 15;

    return Container(
      height: 60,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => Navigator.popAndPushNamed(context, '/following'),
            child: Container(
              width: highlightedIconWidth,
              height: highlightedIconHeight,
              decoration: BoxDecoration(
                color: selectedPage == 'favorite' ? highlightedIconBackgroundColor : null,
                borderRadius: BorderRadius.circular(highlightedIconBorderRadius),
              ),
              child: const Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.popAndPushNamed(context, '/home'),
            child: Container(
              width: highlightedIconWidth,
              height: highlightedIconHeight,
              decoration: BoxDecoration(
                color: selectedPage == 'home' ? highlightedIconBackgroundColor : null,
                borderRadius: BorderRadius.circular(highlightedIconBorderRadius),
              ),
              child: const Icon(
                FontAwesomeIcons.house,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.popAndPushNamed(context, '/profile');
            },
            child: Container(
              width: highlightedIconWidth,
              height: highlightedIconHeight,
              decoration: BoxDecoration(
                color: selectedPage == 'profile' ? highlightedIconBackgroundColor : null,
                borderRadius: BorderRadius.circular(highlightedIconBorderRadius),
              ),
              child: const Icon(
                FontAwesomeIcons.solidUser,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
