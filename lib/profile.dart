import 'package:flutter/material.dart';
import 'package:uxlec/login.dart';
import 'package:uxlec/main.dart';
import 'package:uxlec/menu.dart';
import 'package:uxlec/other/colors.dart';
import 'package:uxlec/navigation.dart';
import 'package:uxlec/gameguide.dart';
import 'package:uxlec/game_screen.dart';
import 'package:uxlec/stats.dart';
import 'package:uxlec/streaks.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                        color: Colors.black,
                      ),
                    )),
              ],
            ),
            Container(
              width: 140,
              height: 126,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('images/profile-picture.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Username', 
                  style: TextStyle(
                    color: AppColors.b,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.edit,
                    color: AppColors.b,
                  )
                ],
              ),
            ),
            Text('1000 points'),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 208,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.b),
                    foregroundColor: MaterialStateProperty.all(AppColors.w),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Stats()),
                  );
                },
                child: Text(
                  'Statistics',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 208,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.b),
                    foregroundColor: MaterialStateProperty.all(AppColors.w),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Streaks()),
              );
                },
                child: Text(
                  'Streaks',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 86,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.g),
                    foregroundColor: MaterialStateProperty.all(AppColors.w),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Menu()),
              );
                },
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
