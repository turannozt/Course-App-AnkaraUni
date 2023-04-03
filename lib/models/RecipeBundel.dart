// ignore_for_file: file_names

import 'package:flutter/material.dart';

class RecipeBundle {
  final int id, chefs;
  final String title, description, imageSrc;
  final Color color;

  RecipeBundle({
    required this.id,
    required this.chefs,
    required this.title,
    required this.description,
    required this.imageSrc,
    required this.color,
  });
}

// Demo list
List<RecipeBundle> recipeBundles = [
  RecipeBundle(
    id: 1,
    chefs: 2,

    title: "Temel Seviye",
    description: "Temel Seviye Kartları ve Sınavları İçerir.",
    imageSrc: "assets/images/cook_new@2x.png",
    color: const Color(0xFFD82D40),
  ),
  RecipeBundle(
    id: 2,
    chefs: 2,
  
    title: "Orta Seviye",
    description: "Orta Seviye Kartları ve Sınavları İçerir.",
    imageSrc: "assets/images/best_2020@2x.png",
    color: const Color(0xFF90AF17),
  ),
  RecipeBundle(
    id: 3,
    chefs: 2,
  
    title: "Uzman Seviye",
    description: "Uzman Seviye Kartları ve Sınavları İçerir.",
    imageSrc: "assets/images/food_court@2x.png",
    color: const Color(0xFF2DBBD8),
  ),
];
