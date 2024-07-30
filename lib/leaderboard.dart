import 'package:flutter/material.dart';
import 'package:uxlec/main.dart';
import 'package:uxlec/other/colors.dart';
import 'package:uxlec/navigation.dart';
import 'package:uxlec/gameguide.dart';
import 'package:uxlec/game_screen.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navigation(),
      appBar: AppBar(
        title: GestureDetector(
          onTap: (){
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
                    'Leaderboards',
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
              Container(
                padding: EdgeInsets.all(16.0),
                width: 350,
                height: 167,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: buildProfile(2, 'Username', '1000 points'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: buildProfile(1, 'Username', '1000 points'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: buildProfile(3, 'Username', '1000 points'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: leaderProfile(4, 'username', '1000 points'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: leaderProfile(5, 'username', '1000 points'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: leaderProfile(6, 'username', '1000 points'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: leaderProfile(7, 'username', '1000 points'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: leaderProfile(8, 'username', '1000 points'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: leaderProfile(9, 'username', '1000 points'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: leaderProfile(10, 'username', '1000 points'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildProfile(int rank, String username, String points) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Stack(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('images/profile-picture.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            // top: 4,
            // right: 4,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.black.withOpacity(0.7),
              child: Text(
                rank.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 8),
      Text(
        username,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        points,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
    ],
  );
}

Widget leaderProfile(int rank, String username, String points) {
  return Container(
    padding: EdgeInsets.all(16.0),
    width: 350,
    height: 70,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              rank.toString(),
            ),
            SizedBox(
              width: 7,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('images/profile-picture.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 7,
            ),
            Text(
              username,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          points,
          style: TextStyle(
            fontSize: 12,
            color: AppColors.g,
          ),
        ),
      ],
    ),
  );
}
