import 'package:flutter/material.dart';
import 'package:uxlec/other/colors.dart';
import 'package:uxlec/profile.dart';
import 'package:uxlec/leaderboard.dart';

class Bar extends StatefulWidget {
  const Bar({super.key});

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Logo'),
      backgroundColor: Colors.white,
      actions: [
            IconButton(
              icon: Icon(Icons.help_outline, color: Colors.black),
              onPressed: () {
                
              },
            ),
          ],
    );
  }
}
