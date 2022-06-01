import 'package:flutter/material.dart';

String title = 'Workout 1';
String lorem =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
bool value = false;
bool value2 = false;
bool value3 = false;
bool value4 = false;
bool value5 = false;

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  // final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout 1'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.black26,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 30),
                ),
                const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                CheckboxListTile(
                  value: value,
                  onChanged: (bool? value2) {
                    setState(() {
                      value = !value;
                    });
                  },
                  title: Text('2 sets of 10 pushups'),
                ),
                CheckboxListTile(
                  value: value2,
                  onChanged: (bool? test) {
                    setState(() {
                      value2 = !value2;
                    });
                  },
                  title: Text('2 sets of 10 pullups'),
                ),
                CheckboxListTile(
                  value: value3,
                  onChanged: (bool? test) {
                    setState(() {
                      value3 = !value3;
                    });
                  },
                  title: Text('Test'),
                ),
                CheckboxListTile(
                  value: value4,
                  onChanged: (bool? test) {
                    setState(() {
                      value4 = !value4;
                    });
                  },
                  title: Text('Test'),
                ),
                CheckboxListTile(
                  value: value5,
                  onChanged: (bool? test) {
                    setState(() {
                      value5 = !value5;
                    });
                  },
                  title: Text('Test'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
