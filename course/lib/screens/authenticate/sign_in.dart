import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

final snackBar = SnackBar(
  content: Text('Signed in anonymously successfully!'),
);

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              UserCredential userCredential =
                  await FirebaseAuth.instance.signInAnonymously();
              ScaffoldMessenger.of(context)
                  .showSnackBar(snackBar);  // Show the snackbar

              // TODO: Handle the sign-in result
            } catch (e) {
              print('Error signing in anonymously: $e');
            }
          },
          child: Text('Sign In Anonymously'),
        ),
      ),
    );
  }
}
