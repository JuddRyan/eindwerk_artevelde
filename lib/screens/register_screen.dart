import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final String tEmail = 'E-mail', tPassword = 'Password', tAccount = 'Already have an account?';

  // Input field controllers
  // These controllers will keep track of the users input
  // _variables are private variables
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();

  Future register() async {
    // Creating user
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    createUserDocument();

    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }

  Future createUserDocument() async {
    // Get user id from firebase
    final userId = FirebaseAuth.instance.currentUser!.uid;
    // Create a new document for the user with the uid
    await FirebaseFirestore.instance.collection('users').doc(userId).set({
      'fullName': _fullNameController.text.trim(),
      'age': int.parse(_ageController.text.trim()),
      'height': _heightController.text.trim(),
      'email': _emailController.text.trim(),
    });
  }

  @override
  void dispose() {
    // After signing in the controllers won't be needed anymore
    // disposing them will help free up memory for the app
    _emailController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          // color: Color(0xFFAABBCC),
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Register',
                  style: TextStyle(fontSize: 40),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tEmail),
                    TextField(
                      controller: _emailController,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Fullname'),
                    TextField(
                      controller: _fullNameController,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Age'),
                    TextField(
                      controller: _ageController,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Height'),
                    TextField(
                      controller: _heightController,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tPassword),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () => Navigator.popAndPushNamed(context, '/login'),
                  child: Text(tAccount),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: register,
                  // onPressed: () {
                  //   // Navigator.pushNamed(context, '/');
                  //   // Navigator.popAndPushNamed(context, '/');
                  //   Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                  // },
                  child: const Text('Register'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
