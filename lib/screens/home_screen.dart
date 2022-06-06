// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eindwerk_lite/components/bottom_navigation.dart';
import 'package:eindwerk_lite/components/custom_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference training = FirebaseFirestore.instance.collection('training-plans');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: training.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Text('Loading...');
          }

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
            ),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              final doc = snapshot.data!.docs[index];
              return SimpleCard(
                margin: 4,
                // onTap: () => Navigator.pushNamed(context, '/workout', arguments: WorkoutArguments("Hangboard Training", "https://www.trainingbeta.com/wp-content/uploads/2016/01/hangboard1.jpg")),
                route: '/workout',
                image: "https://www.trainingbeta.com/wp-content/uploads/2016/01/hangboard1.jpg",
                title: doc['title'],
                description: doc['description'],
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigation(),
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
