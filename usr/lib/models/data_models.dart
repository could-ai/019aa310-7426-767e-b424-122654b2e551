import 'package:flutter/material.dart';

class Animal {
  final String name;
  final String soundDescription;
  final IconData icon;
  final Color color;

  Animal({
    required this.name,
    required this.soundDescription,
    required this.icon,
    required this.color,
  });
}

class Song {
  final String title;
  final String duration;
  final String lyrics;

  Song({
    required this.title,
    required this.duration,
    required this.lyrics,
  });
}
