import 'package:flutter/material.dart';
import 'package:uxlec/main.dart';
import 'package:uxlec/other/colors.dart';
import 'package:uxlec/navigation.dart';
import 'package:uxlec/gameguide.dart';
import 'package:url_launcher/url_launcher.dart';

class Challanges extends StatefulWidget {
  const Challanges({super.key});

  @override
  State<Challanges> createState() => _ChallangesState();
}

class _ChallangesState extends State<Challanges> {
  @override
  Widget build(BuildContext context) {
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
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
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
                    'Challanges',
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
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'This page consists quests from the previous days. Complete them to earn more points!',
                  textAlign: TextAlign.center,
                ),
              ),
              ChallengeCard(
                date: 'July 15th, 2024',
                challengeItems: ['?', '?', '?', '?', '?'],
                buttonText: 'Play',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameScreen()),
                  );
                },
              ),
              ChallengeCard(
                date: 'July 14th, 2024',
                challengeItems: ['S', 'W', 'O', 'O', 'N'],
                buttonText: 'Share',
                onPressed: () {
                  // Handle button press for July 14th challenge
                },
              ),
              ChallengeCard(
                date: 'July 13th, 2024',
                challengeItems: ['K', 'E', 'N', 'Z', 'I'],
                buttonText: 'Share',
                onPressed: () {
                  // Handle button press for July 13th challenge
                },
              ),
              ChallengeCard(
                date: 'July 12th, 2024',
                challengeItems: ['?', '?', '?', '?', '?'],
                buttonText: 'Play',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameScreen()),
                  );
                },
              ),
              ChallengeCard(
                date: 'July 11th, 2024',
                challengeItems: ['?', '?', '?', '?', '?'],
                buttonText: 'Play',
                onPressed: () {
                  // Handle button press for July 12th challenge
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChallengeCard extends StatelessWidget {
  final String date;
  final List<String> challengeItems;
  final String buttonText;
  final VoidCallback onPressed; // Change type to VoidCallback

  ChallengeCard({
    required this.date,
    required this.challengeItems,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              date,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: challengeItems.map((item) {
                return Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: item.contains('?')
                        ? Colors.grey[300]
                        : Colors.lightGreen[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      item,
                      style: TextStyle(
                          fontSize: 23.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerRight, 
              child: Container(
                width: MediaQuery.of(context).size.width / 4, 
                child: ElevatedButton(
                  onPressed: onPressed, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, 
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6), 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), 
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18, 
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
