import 'package:flutter/material.dart';
import 'package:uxlec/menu.dart';
import 'package:uxlec/game_screen.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: Menu(),
    );
  }
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final List<String> possibleWords = [
    "SKATE",
    "HOUSE",
    "PLANE",
    "CRANE",
    "BRICK",
    "CHAIR",
    "TABLE",
    "WATER",
    "MOUSE",
    "PHONE",
    "BREAD",
    "CLOUD",
    "STONE",
    "GRASS",
    "BRUSH",
    "SHELF",
    "PLATE",
    "KNIFE",
    "FLOOR",
    "DOORS",
    "COINS",
    "FRUIT",
    "JUICE",
    "CANDY",
    "STRAW",
    "BOOTS",
    "GLASS",
    "STARS",
    "PLANT",
    "LEMON",
    "GRAPE",
    "MANGO",
    "PEACH",
    "PEARS",
    "RIVER",
    "SHOES",
    "SNEAK",
    "SPORT",
    "YOUTH",
    "SPACE",
    "TRAIN",
    "TRAIL",
    "TIGER",
    "ZEBRA",
    "HORSE",
    "CAMEL",
    "CROWD",
    "CROWN",
    "BLEND",
    "SHINE",
    "BLANK",
    "STORM",
    "TRACE",
    "GRACE",
    "CROSS",
    "GLIDE",
    "FLEET",
    "SPEED",
    "FLARE",
    "POINT",
    "BLAST",
    "CRISP",
    "REACT",
    "ADMIT",
    "BEGIN",
    "MIRTH",
    "BOUND",
    "CLASP",
    "SHOUT",
    "SHARP",
    "DANCE",
    "FLYER",
    "BRAND",
    "WAVES",
    "SPLIT",
    "STAND",
    "TEACH",
    "CHILL",
    "SPARK",
    "PRIZE",
    "TRUMP",
    "FLOAT",
    "BREAD",
    "CRUSH",
    "TANGO",
    "BLUSH",
    "SHOOT"
  ];

  late String correctWord;
  List<List<String>> guessedWords = [];
  String currentGuess = "";
  final int maxGuesses = 5;
  bool gameWon = false;
  bool gameOver = false;
  Map<String, Color> keyColors = {};

  @override
  void initState() {
    super.initState();
    _resetGame();
  }

  void _resetGame() {
    setState(() {
      correctWord = possibleWords[Random().nextInt(possibleWords.length)];
      guessedWords.clear();
      currentGuess = "";
      gameWon = false;
      gameOver = false;
      keyColors.clear();
    });
  }

  void addGuess() {
    if (currentGuess.length == 5 && guessedWords.length < maxGuesses) {
      setState(() {
        guessedWords.add(currentGuess.split(''));
        _updateKeyColors();
        if (currentGuess == correctWord) {
          gameWon = true;
          gameOver = true;
          showResultDialog(); // Show dialog when the game is won
        } else if (guessedWords.length >= maxGuesses) {
          gameOver = true;
          showResultDialog(); // Show dialog when the game is over (loss)
        }
        currentGuess = "";
      });
    }
  }

  Future<void> showResultDialog() async {
    String title = gameWon ? 'Congratulations!' : 'Game Over';
    String content = gameWon
        ? 'You guessed the word! The correct word was "$correctWord".\n\nYou have gained 10 points!'
        : 'The correct word was "$correctWord".\n\nBetter luck next time!';

    // Placeholder for meaning
    String meaning = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.';

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(child: Text(title)),
        content: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                  child: Text(
                content,
              )),
              if (gameWon) ...[
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    'Meaning: $meaning',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ],
          ),
        ),
        actions: [
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _resetGame(); // Reset the game when the dialog is dismissed
              },
              child: Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }

  void updateGuess(String letter) {
    if (currentGuess.length < 5) {
      setState(() {
        currentGuess += letter;
      });
    }
  }

  void handleKeyEvent(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.enter) {
        addGuess();
      } else if (event.logicalKey == LogicalKeyboardKey.backspace) {
        if (currentGuess.isNotEmpty) {
          setState(() {
            currentGuess = currentGuess.substring(0, currentGuess.length - 1);
          });
        }
      } else {
        final String keyLabel = event.logicalKey.keyLabel.toUpperCase();
        if (keyLabel.length == 1 && keyLabel.contains(RegExp(r'[A-Z]'))) {
          updateGuess(keyLabel);
        }
      }
    }
  }

  void onScreenKeyPress(String key) {
    if (key == 'ENTER') {
      addGuess();
    } else if (key == 'BACKSPACE') {
      if (currentGuess.isNotEmpty) {
        setState(() {
          currentGuess = currentGuess.substring(0, currentGuess.length - 1);
        });
      }
    } else {
      updateGuess(key);
    }
  }

  void _updateKeyColors() {
    for (var i = 0; i < currentGuess.length; i++) {
      String letter = currentGuess[i];
      if (correctWord[i] == letter) {
        keyColors[letter] = Color(0xFFAEF78E);
      } else if (correctWord.contains(letter)) {
        keyColors[letter] = Color(0xFFC0D461);
      } else {
        keyColors[letter] = Colors.black;
      }
    }
  }

  Color getTileColor(String letter, int pos) {
    if (correctWord[pos] == letter) {
      return Color(0xFFAEF78E);
    } else if (correctWord.contains(letter)) {
      return Color(0xFFC0D461);
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GameUI(
      gameWon: gameWon,
      gameOver: gameOver,
      correctWord: correctWord,
      guessedWords: guessedWords,
      currentGuess: currentGuess,
      getTileColor: getTileColor,
      handleKeyEvent: handleKeyEvent,
      resetGame: _resetGame,
      onScreenKeyPress: onScreenKeyPress,
      keyColors: keyColors,
    );
  }
}
