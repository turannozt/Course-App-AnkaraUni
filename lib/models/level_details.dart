// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LevelDetailsA1 {
  final int id;
  final String title, description, imageSrc;
  final Color color;

  LevelDetailsA1({
    required this.id,
    required this.title,
    required this.description,
    required this.imageSrc,
    required this.color,
  });
}

// Demo list
List<LevelDetailsA1> levelDetailsA1 = [
  LevelDetailsA1(
    id: 1,
    title: "A1 Seviye",
    description: "A1 Seviye Kartları ve Sınavları İçerir.",
    imageSrc: "assets/images/cook_new@2x.png",
    color: const Color(0xFFD82D40),
  ),
  LevelDetailsA1(
    id: 2,
    title: "A2 Seviye",
    description: "A2 Seviye Kartları ve Sınavları İçerir.",
    imageSrc: "assets/images/best_2020@2x.png",
    color: const Color(0xFF90AF17),
  ),
];

class LevelDetailsB1 {
  final int id;
  final String title, description, imageSrc;
  final Color color;

  LevelDetailsB1({
    required this.id,
    required this.title,
    required this.description,
    required this.imageSrc,
    required this.color,
  });
}

// Demo list
List<LevelDetailsB1> levelDetailsB1 = [
  LevelDetailsB1(
    id: 1,
    title: "B1 Seviye",
    description: "B1 Seviye Kartları ve Sınavları İçerir.",
    imageSrc: "assets/images/cook_new@2x.png",
    color: const Color(0xFFD82D40),
  ),
  LevelDetailsB1(
    id: 2,
    title: "B2 Seviye",
    description: "B2 Seviye Kartları ve Sınavları İçerir.",
    imageSrc: "assets/images/best_2020@2x.png",
    color: const Color(0xFF90AF17),
  ),
];

class LevelDetailsC1 {
  final int id;
  final String title, description, imageSrc;
  final Color color;

  LevelDetailsC1({
    required this.id,
    required this.title,
    required this.description,
    required this.imageSrc,
    required this.color,
  });
}

List<LevelDetailsC1> levelDetailsC1 = [
  LevelDetailsC1(
    id: 1,
    title: "C1 Seviye",
    description: "C1 Seviye Kartları ve Sınavları İçerir.",
    imageSrc: "assets/images/cook_new@2x.png",
    color: const Color(0xFFD82D40),
  ),
  LevelDetailsC1(
    id: 2,
    title: "C2 Seviye",
    description: "C2 Seviye Kartları ve Sınavları İçerir.",
    imageSrc: "assets/images/best_2020@2x.png",
    color: const Color(0xFF90AF17),
  ),
];

class QuizDetails {
  final int id;
  final String title, description, imageSrc;
  final Color color;

  QuizDetails({
    required this.id,
    required this.title,
    required this.description,
    required this.imageSrc,
    required this.color,
  });
}

List<QuizDetails> quizDetails = [
  QuizDetails(
    id: 1,
    title: "Temel Seviye Sınavı",
    description: "Temel Seviye Sınavı İçerir.",
    imageSrc: "assets/images/main.png",
    color: const Color(0xFFD82D40),
  ),
  QuizDetails(
    id: 2,
    title: "Orta Seviye Sınavı",
    description: "Orta Seviye Sınavı İçerir.",
    imageSrc: "assets/images/best_2020@2x.png",
    color: const Color(0xFF2DBBD8),
  ),
  QuizDetails(
    id: 3,
    title: "Uzman Seviye Sınavı",
    description: "Uzman Seviye Sınavı İçerir.",
    imageSrc: "assets/images/image_1.png",
    color: const Color(0xFF90AF17),
  ),
];
