import 'package:basketballteams/homepage.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "lib/homepage.dart");
                },
                child: const Text('Show Teams')),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "lib/players.dart");
                },
                child: const Text('Show Players')),
          ],
        ),
      ),
    );
  }
}
