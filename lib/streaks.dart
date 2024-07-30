import 'package:flutter/material.dart';
import 'package:uxlec/main.dart';
import 'package:uxlec/other/colors.dart';
import 'package:uxlec/navigation.dart';
import 'package:uxlec/gameguide.dart';
import 'package:uxlec/game_screen.dart';

class Streaks extends StatefulWidget {
  const Streaks({super.key});

  @override
  State<Streaks> createState() => _StreaksState();
}

class _StreaksState extends State<Streaks> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      drawer: Navigation(),
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GameScreen()),
            );
          },
          child: const Text(
            'WordQuest',
            style: TextStyle(color: AppColors.b, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline, color: AppColors.b),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Gameguide()),
              );
            },
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: const EdgeInsets.all(0),
                      icon: Container(
                        width: 40,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.b,
                        ),
                      )),
                  Text(
                    'Streaks',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.b,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  )
                ],
              ),
          Padding(
            padding: const EdgeInsets.all(16.0), // General padding for the body
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 60.0), // Padding for the '12 days' text
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '12',
                        style: TextStyle(
                          fontSize: 90,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 20.0), // Space between '12' and 'days'
                      Text(
                        'days',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20), // Space between '12 days' and the text below
                Text(
                  '12 Day Streak!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Complete a WordQuest every day to build your streak.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center, // Center-align the text
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Implement button action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Background color
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    'Share',
                    style: textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
