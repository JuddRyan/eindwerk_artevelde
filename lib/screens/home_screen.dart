// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eindwerk_lite/components/bottom_navigation.dart';
import 'package:eindwerk_lite/components/custom_card.dart';
import 'package:eindwerk_lite/templates/card_template_1.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListRowItems(),
          ListRowItems(),
          ListRowItems(),
          ListRowItems(),
        ],
      ),
      bottomNavigationBar: BottomNavigation(key: key),
    );
  }
}

class ListRowItems extends StatelessWidget {
  const ListRowItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      // adding intrinsicHeight fixed bug
      /*
				throw FlutterError.fromParts(<DiagnosticsNode>[
					message,
					if (informationCollector != null) ...informationCollector(),
					DiagnosticsProperty<BoxConstraints>('The offending constraints were', this, style: DiagnosticsTreeStyle.errorProperty),
				]);
			*/
      child: Container(
        height: 200,
        margin: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              // load custom card component
              child: SimpleCard(
                // onTap: () => Navigator.pushNamed(context, '/workout', arguments: WorkoutArguments("Hangboard Training", "https://www.trainingbeta.com/wp-content/uploads/2016/01/hangboard1.jpg")),
                route: '/workout',
                image: "https://www.trainingbeta.com/wp-content/uploads/2016/01/hangboard1.jpg",
                title: 'Hangboard Training',
                description: "This guide will go over de basics of hangboarding",
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: SimpleCard(
                route: '/workout',
                title: 'Improve your crimps',
                description: "Specific training to help holding crimps",
                image: 'https://pulseclimbing.com.au/wp-content/uploads/2016/05/HAND.jpg',
              ),
            )
          ],
        ),
      ),
    );
  }
}
