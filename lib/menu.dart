import 'package:flutter/material.dart';
import 'package:uxlec/login.dart';
import 'package:uxlec/main.dart';
import 'package:uxlec/other/colors.dart';
import 'package:uxlec/game_screen.dart';
import 'package:uxlec/gameguide.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.w,
          child:  Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'WordQuest',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                ),
                const SizedBox(height: 20,),
                const SizedBox(
                  width: 208,
                  child: Text(
                    'Expand your vocabulary!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                SizedBox(
                  width: 208,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.b),
                      foregroundColor: MaterialStateProperty.all(AppColors.w),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      )
                    ),
                    onPressed: () { 
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GameScreen()),
                      );
                    },
                    child: Text(
                      'Play',
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
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      )
                    ),
                    onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Gameguide()),
                      );},
                    child: Text(
                      'Game Guide',
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
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      )
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Text(
                      'Login/Register',
                      style: TextStyle(color: Colors.white),
                      ),
                  ),
                ),  
              ],
            ),
            
          ),
        ),
      ),
    );
  }
}