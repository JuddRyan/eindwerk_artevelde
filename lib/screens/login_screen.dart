import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String tEmail = 'E-mail', tPassword = 'Password', tAccount = 'Don\'t have an account yet?';

  // Input field controllers
  // These controllers will keep track of the users input
  // _variables are private variables
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      // trim to return a simple string
      // instead of \Dart is fun\n
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }

  @override
  void dispose() {
    // After signing in the controllers won't be needed anymore
    // disposing them will help free up memory for the app
    _emailController.dispose();
    _passwordController.dispose();
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Login',
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
                  Text(tPassword),
                  TextField(
                    obscureText: true,
                    controller: _passwordController,
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/forgot');
                },
                child: const Text('Forgot password?'),
              ),
              // const SizedBox(
              //   height: 40,
              // ),
              ElevatedButton(
                onPressed: signIn,
                child: const Text('Sign In'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/register', (route) => false);
                },
                child: const Text('Don\'t have an acount yet?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
