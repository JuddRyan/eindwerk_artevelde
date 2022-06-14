import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eindwerk_lite/components/bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/custom_card.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({Key? key}) : super(key: key);

  @override
  State<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  // CollectionReference workouts = FirebaseFirestore.instance.collection('users').doc();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    CollectionReference<Map<String, dynamic>> favoriteWorkouts = FirebaseFirestore.instance.collection('users').doc(userId).collection('workouts');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Following workouts'),
      ),
      body: StreamBuilder(
        stream: favoriteWorkouts.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Text('Loading...');
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                route: '/workout',
                id: doc.id,
                image: doc['image'],
                title: doc['title'],
                description: doc['description'],
                exercises: doc['exercises'],
              );
            },
          );
        },
      ),
      bottomNavigationBar: const BottomNavigation(selectedPage: 'favorite'),
    );
  }
}
