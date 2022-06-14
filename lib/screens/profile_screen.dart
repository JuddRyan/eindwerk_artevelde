// ignore_for_file: prefer_const_constructors

import 'package:eindwerk_lite/components/bottom_navigation.dart';
import 'package:eindwerk_lite/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

int age = 35;
double weight = 78.3;
int height = 176;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    String userId = FirebaseAuth.instance.currentUser!.uid;
    DocumentReference<Map<String, dynamic>> userInfo = FirebaseFirestore.instance.collection('users').doc(userId);

    return StreamBuilder(
      stream: users.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (!streamSnapshot.hasData) {
          return const Text('Loading...');
        }
        final userData = streamSnapshot.data!.docs[0];
        return Container(
          color: Colors.white,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Profile'),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                  // height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // TODO: Load image from firebase
                      GestureDetector(
                        onTap: () {
                          // alert dialog to change profile picture
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Change profile picture'),
                                content: Text('Coming soon'),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          userData['fullName'],
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(
                          userData['age'].toString(),
                          style: TextStyle(fontSize: 30),
                        ),
                        Text('yo'),
                      ],
                    ),
                    Container(
                      height: 30,
                      width: 2,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        Text(
                          userData['height'].toString(),
                          style: TextStyle(fontSize: 30),
                        ),
                        Text('cm'),
                      ],
                    ),
                  ],
                ),
                // Container(
                //   // color: Colors.blueAccent.shade100,
                //   height: 200,
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       // TODO: make variable
                //       Text(
                //         'Your workouts',
                //         style: TextStyle(
                //           fontSize: 25,
                //         ),
                //       ),
                //       Row(
                //         children: [
                //           Container(
                //             width: 200,
                //             height: 120,
                //             color: Colors.amber,
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 200,
                ),
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                  },
                  child: Text('Sign Out'),
                ),
                Expanded(
                  child: Container(
                      // TODO: add chart here
                      // progress chart will come here
                      // color: Colors.grey.shade400,
                      ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigation(selectedPage: 'profile'),
          ),
        );
      },
    );
  }
}
