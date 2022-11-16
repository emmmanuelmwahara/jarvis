import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'Jarvis',
              style: TextStyle(color: Colors.blue),
            ),
            expandedHeight: 200.0,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Text(
                'Hello',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
