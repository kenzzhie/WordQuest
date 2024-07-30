// game_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uxlec/gameguide.dart';
import 'package:uxlec/main.dart';
import 'package:uxlec/navigation.dart';
import 'package:uxlec/other/colors.dart';

class GameUI extends StatelessWidget {
  final bool gameWon;
  final bool gameOver;
  final String correctWord;
  final List<List<String>> guessedWords;
  final String currentGuess;
  final Color Function(String, int) getTileColor;
  final Function(RawKeyEvent) handleKeyEvent;
  final VoidCallback resetGame;
  final void Function(String) onScreenKeyPress;
  final Map<String, Color> keyColors;

  GameUI({
    required this.gameWon,
    required this.gameOver,
    required this.correctWord,
    required this.guessedWords,
    required this.currentGuess,
    required this.getTileColor,
    required this.handleKeyEvent,
    required this.resetGame,
    required this.onScreenKeyPress,
    required this.keyColors,
  });

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
      body: FocusScope(
        node: FocusScopeNode(),
        child: RawKeyboardListener(
          focusNode: FocusNode()..requestFocus(),
          onKey: handleKeyEvent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: WordleGrid(
                          guessedWords: guessedWords,
                          currentGuess: currentGuess,
                          getTileColor: getTileColor,
                        ),
                      ),
                    ),
                    if (gameOver) ...[
                      const SizedBox(height: 20),
                      if (gameWon)
                        //  const Column(
                        //    children: [
                        //      Padding(
                        //        padding: const EdgeInsets.only(left: 16, right: 16),
                        //        child: Text(
                        //         'Congratulations! You guessed the word!',
                        //         style: TextStyle(
                        //             fontSize: 16, fontWeight: FontWeight.bold),
                        //                                ),
                        //      ),
                        //    ],
                        //  )
                        SizedBox(width: 5,)
                      else
                        // Column(
                        //   children: [
                        //     const Text(
                        //       'Game Over! The correct word was:',
                        //       style: TextStyle(
                        //           fontSize: 24.0, fontWeight: FontWeight.bold),
                        //     ),
                        //     Text(
                        //       correctWord,
                        //       style: const TextStyle(
                        //           fontSize: 24.0,
                        //           fontWeight: FontWeight.bold,
                        //           color: Colors.red),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(width: 5,)
                      // ElevatedButton(
                      //   onPressed: resetGame,
                      //   child: const Text('Play Again'),
                      // ),
                    ],
                    const SizedBox(
                        height: 15), // Increased space to move keyboard higher
                    OnScreenKeyboard(
                        onKeyPress: onScreenKeyPress, keyColors: keyColors),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WordleGrid extends StatelessWidget {
  final List<List<String>> guessedWords;
  final String currentGuess;
  final Color Function(String, int) getTileColor;

  WordleGrid({
    required this.guessedWords,
    required this.currentGuess,
    required this.getTileColor,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount: 25, // Adjusted to 5 rows only
      itemBuilder: (context, index) {
        int wordIndex = index ~/ 5;
        int letterIndex = index % 5;

        String letter = '';
        Color tileColor = Colors.grey;

        if (wordIndex < guessedWords.length) {
          letter = guessedWords[wordIndex][letterIndex];
          tileColor = getTileColor(letter, letterIndex);
        } else if (wordIndex == guessedWords.length) {
          if (letterIndex < currentGuess.length) {
            letter = currentGuess[letterIndex];
          }
        }

        return LetterTile(letter: letter, backgroundColor: tileColor);
      },
    );
  }
}

class LetterTile extends StatelessWidget {
  final String letter;
  final Color backgroundColor;

  LetterTile({required this.letter, this.backgroundColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.black, width: 1.0),
      ),
      child: Center(
        child: Text(
          letter,
          style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class OnScreenKeyboard extends StatelessWidget {
  final void Function(String) onKeyPress;
  final Map<String, Color> keyColors;

  OnScreenKeyboard({required this.onKeyPress, required this.keyColors});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildKeyboardRow('QWERTYUIOP', onKeyPress, keyColors),
        _buildKeyboardRow('ASDFGHJKL', onKeyPress, keyColors),
        _buildLastRow(onKeyPress, keyColors),
      ],
    );
  }

  Widget _buildKeyboardRow(String keys, void Function(String) onKeyPress,
      Map<String, Color> keyColors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: keys.split('').map((key) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            width: 32, // Adjusted width
            height: 44, // Adjusted height
            child: ElevatedButton(
              onPressed: () => onKeyPress(key),
              style: ElevatedButton.styleFrom(
                backgroundColor: keyColors[key] ?? Colors.grey,
                padding: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text(
                key,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLastRow(
      void Function(String) onKeyPress, Map<String, Color> keyColors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            width: 64, // Adjusted width
            height: 44, // Adjusted height
            child: ElevatedButton(
              onPressed: () => onKeyPress('ENTER'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                padding: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Text('ENTER',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ),
        ),
        ...'ZXCVBNM'.split('').map((key) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              width: 32, // Adjusted width
              height: 44, // Adjusted height
              child: ElevatedButton(
                onPressed: () => onKeyPress(key),
                style: ElevatedButton.styleFrom(
                  backgroundColor: keyColors[key] ?? Colors.grey,
                  padding: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text(
                  key,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          );
        }).toList(),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            width: 64, // Adjusted width
            height: 44, // Adjusted height
            child: ElevatedButton(
              onPressed: () => onKeyPress('BACKSPACE'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                padding: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Icon(Icons.backspace, color: Colors.white, size: 18),
            ),
          ),
        ),
      ],
    );
  }
}
