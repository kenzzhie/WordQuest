import 'package:flutter/material.dart';
import 'package:uxlec/gameguide.dart';
import 'package:uxlec/main.dart';
import 'package:uxlec/other/colors.dart';
import 'package:uxlec/navigation.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // @override
  final Map<String, bool> _toggleStates = {
    'Advanced Difficulty': false,
    'Dark Mode': false,
    'Reminder': false,
  };

  final Map<String, String> _descriptions = {
    'Advanced Difficulty': 'Any hints given must be used in the next guesses.',
    'Dark Mode':
        'Ideal for night use, Dark Mode offers a comfortable and stylish experience.',
    'Reminder':
        'Reminds your streaks, statistics, new challenges, and new words.',
  };

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
        color: Colors.white, // Background color for the ListView
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: _toggleStates.keys.map((String key) {
            return _buildSwitchTile(key, _descriptions[key]!);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildSwitchTile(String title, String description) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white, // Background color for the ListTile
        borderRadius: BorderRadius.circular(8.0), // Optional: rounded corners
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(19.0),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins', // Custom font family
            fontSize: 18, // Custom font size for the title
            fontWeight: FontWeight.bold, // Custom font weight
            color: Colors.black, // Custom font color
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            fontFamily: 'Poppins', // Custom font family
            fontSize: 13, // Custom font size for the subtitle
            color: Colors.grey[600], // Custom font color for the subtitle
          ),
        ),
        trailing: Switch(
          value: _toggleStates[title]!,
          onChanged: (bool value) {
            setState(() {
              _toggleStates[title] = value;
            });
          },
          activeColor: Colors.blue, // Color when the switch is on
          inactiveTrackColor:
              Colors.grey[300], // Track color when the switch is off
          inactiveThumbColor: Colors.grey, // Thumb color when the switch is off
        ),
      ),
    );
  }
}
