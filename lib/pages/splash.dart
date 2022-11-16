import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'authenticate.dart';
import 'home.dart';

class SplashPage extends StatefulWidget {
  static const String id = 'splash';
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //authenticating user
  final FirebaseAuth fireAuth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    fireAuth.authStateChanges().listen((User? user) {
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else {
        Navigator.pushReplacementNamed(context, Authenticate.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
