import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  Future register() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
    );
  }
}
