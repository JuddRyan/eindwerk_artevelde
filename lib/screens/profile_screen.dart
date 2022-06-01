// ignore_for_file: prefer_const_constructors

import 'package:eindwerk_lite/components/bottom_navigation.dart';
import 'package:flutter/material.dart';

int age = 35;
double weight = 78.3;
int height = 176;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // TODO: Load image from firebase
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'John Doe',
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
                        age.toString(),
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
                        age.toString(),
                        style: TextStyle(fontSize: 30),
                      ),
                      Text('kg'),
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
                        age.toString(),
                        style: TextStyle(fontSize: 30),
                      ),
                      Text('cm'),
                    ],
                  ),
                ],
              ),
              Container(
                color: Colors.blueAccent.shade100,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // TODO: make variable
                    Text(
                      'Your workouts',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 200,
                          height: 120,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ],
                ),
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
          bottomNavigationBar: BottomNavigation(key: key),
        ),
      ),
    );
  }
}
