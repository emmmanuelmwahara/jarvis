import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jarvis/pages/authenticate.dart';
import 'package:jarvis/pages/home.dart';
import 'package:jarvis/pages/splash.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jarvis',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashPage.id,
      routes: {
        HomePage.id: (context) => const HomePage(),
        SplashPage.id: (context) => const SplashPage(),
        Authenticate.id: (context) => const Authenticate(),
      },
    );
  }
}
