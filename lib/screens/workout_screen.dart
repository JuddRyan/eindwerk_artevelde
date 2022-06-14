import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

String title = 'Workout 1';
String lorem = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
bool value = true;
bool value2 = true;
bool value3 = false;
bool value4 = false;
bool value5 = false;

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({
    Key? key,
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.exercises,
  }) : super(key: key);

  final String title, description, image, id;
  final List exercises;

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

Function addWorkoutToUserCollection(String userId, String workoutId) {
  return () async {};
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  // final ValueChanged<bool> onChanged;

  Color starColor = Colors.black;
  IconData starIcon = FontAwesomeIcons.star;

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String userId = FirebaseAuth.instance.currentUser!.uid;

  CollectionReference workouts = FirebaseFirestore.instance.collection('workouts');

  @override
  Widget build(BuildContext context) {
    List exercises = widget.exercises;
    // final arg = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.toString()),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    widget.image.toString(),
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          StreamBuilder(
              stream: workouts.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                // final workoutData = streamSnapshot.data!.docs[0];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 25, top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                              widget.title.toString(),
                              style: const TextStyle(fontSize: 30),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // if star is tapped then change the color and icon
                              // and update firestore
                              setState(() {
                                if (starColor == Colors.black) {
                                  starColor = Colors.yellow;
                                  starIcon = FontAwesomeIcons.solidStar;
                                  FirebaseFirestore.instance.collection('users').doc(userId).collection('workouts').doc(widget.id).set({
                                    'favorite': true,
                                    'exercises': exercises,
                                    'title': widget.title,
                                    'description': widget.description,
                                    'image': widget.image,
                                    'id': widget.id,
                                  });
                                } else {
                                  starColor = Colors.black;
                                  starIcon = FontAwesomeIcons.star;
                                  FirebaseFirestore.instance.collection('users').doc(userId).collection('workouts').doc(widget.id).update({
                                    'favorite': false,
                                  });
                                }
                              });
                            },
                            child: Icon(
                              starIcon,
                              color: starColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(widget.description.toString()),
                    ),
                    // The list view builder needs a static size to load in components
                    SizedBox(
                      height: 300,
                      // dynamically load in the exercises from firebase
                      child: ListView.builder(
                        itemCount: exercises.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (exercises.isNotEmpty) {
                            return CheckboxListTile(
                              value: exercises[index]['value'],
                              // onChanged expects a function that takes a bool value
                              // But we don't use that value so we can just ignore it
                              onChanged: (bool? value) {
                                setState(() {
                                  exercises[index]['value'] = !exercises[index]['value'];
                                  FirebaseFirestore.instance.collection('users').doc(userId).collection('workouts').doc(widget.id).update({
                                    'exercises': exercises,
                                  });
                                });
                              },
                              title: Text(
                                exercises[index]['name'],
                              ),
                            );
                          } else {
                            return const Text('No exercises found');
                          }
                        },
                      ),
                    ),
                  ],
                );
              })
        ],
      ),
    );
  }
}
