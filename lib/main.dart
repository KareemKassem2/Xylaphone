import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  Future<void> playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$soundNumber.wav'));
  }

  Expanded buildKey({Color color = Colors.brown, int soundNumber = 0}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () async {
          playSound(soundNumber);
        },
        style: FilledButton.styleFrom(
          backgroundColor: color,
        ),
        child: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.brown.shade100, soundNumber: 1),
              buildKey(color: Colors.brown.shade200, soundNumber: 2),
              buildKey(color: Colors.brown.shade300, soundNumber: 3),
              buildKey(color: Colors.brown.shade400, soundNumber: 4),
              buildKey(color: Colors.brown.shade500, soundNumber: 5),
              buildKey(color: Colors.brown.shade600, soundNumber: 6),
              buildKey(color: Colors.brown.shade700, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
