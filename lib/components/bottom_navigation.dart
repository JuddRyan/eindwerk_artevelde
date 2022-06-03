// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => Navigator.popAndPushNamed(context, '/editthislater'),
            child: Container(
              child: const Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.popAndPushNamed(context, '/home'),
            child: Container(
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
