import 'package:flutter/material.dart';
import 'package:uxlec/main.dart';
import 'package:uxlec/other/colors.dart';
import 'package:uxlec/navigation.dart';
import 'package:uxlec/game_screen.dart';

class Gameguide extends StatefulWidget {
  const Gameguide({super.key});

  @override
  State<Gameguide> createState() => _GameguideState();
}

class _GameguideState extends State<Gameguide> {
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
                    'How to Play',
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
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Center(
                //   child: Text(
                //     'How to Play',
                //     style: TextStyle(
                //       fontFamily: 'Poppins',
                //       fontSize: 24,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    'Guess the word in 6 tries.',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '● Each word must be a valid 5-letter word.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  '● The color of each tile will change depending on how close your guess is to the word.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 40),
                WordleRow(
                  letters: ['', '', '', '', ''],
                  colors: [Color(0xFFAEF78E), Colors.white, Colors.white, Colors.white, Colors.white],
                  size: 63,
                ),
                const SizedBox(height: 8),
                // const Text(
                //   'Green means the word is in the correct spot.',
                //   style: TextStyle(fontSize: 16),
                // ),
                Center(
                  child: Text(
                    'Green means the word is in the correct spot.',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                WordleRow(
                  letters: ['', '', '', '', ''],
                  colors: [Colors.white, Colors.white, Color(0xFFC0D461), Colors.white, Colors.white],
                  size: 63,
                ),
                const SizedBox(height: 8),
                // const Text(
                //   'Yellow means the word is in the wrong spot.',
                //   style: TextStyle(fontSize: 16),
                // ),
                Center(
                  child: Text(
                    'Yellow means the word is in the wrong spot.',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                WordleRow(
                  letters: ['', '', '', '', ''],
                  colors: [Colors.white, Color(0xFFD9D9D9), Colors.white, Colors.white, Colors.white],
                  size: 63,
                ),
                const SizedBox(height: 8),
                // const Text(
                //   'Gray means the word is not in any spot.',
                //   style: TextStyle(fontSize: 16),
                // ),
                Center(
                  child: Text(
                    'Gray means the word is not in any spot.',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
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

class WordleTile extends StatelessWidget {
  final String letter;
  final Color color;
  final double size;

  const WordleTile({
    Key? key,
    required this.letter,
    required this.color,
    this.size = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(size / 10),
      ),
      child: Center(
        child: Text(
          letter.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class WordleRow extends StatelessWidget {
  final List<String> letters;
  final List<Color> colors;
  final double size;
  final double gap; 

  const WordleRow({
    Key? key,
    required this.letters,
    required this.colors,
    this.size = 69,
    this.gap = 8, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        letters.length,
        (index) => Row(
          children: [
            WordleTile(
              letter: letters[index],
              color: colors[index],
              size: size,
            ),
            if (index < letters.length - 1) SizedBox(width: gap),
          ],
        ),
      ),
    );
  }
}