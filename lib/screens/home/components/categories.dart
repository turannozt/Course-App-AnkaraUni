// ignore_for_file: library_private_types_in_public_api

import 'package:ankarauni/screens/quiz/quiz_page.dart';
import 'package:ankarauni/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../levels/cards.dart';

// Our Category List need StateFullWidget
// I can use Provider on it, Then we dont need StatefulWidget

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Seviyeler", "Kartlar", "Sınavlar"];
  // By default first one is selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: 35, // 35
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategoriItem(index),
        ),
      ),
    );
  }

  Widget buildCategoriItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        if (selectedIndex == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Cards(),
            ),
          );
        }
        if (selectedIndex == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const QuizPage(),
            ),
          );
        }
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.symmetric(
          horizontal: 20, //20
          vertical: 5, //5
        ),
        decoration: BoxDecoration(
            color: selectedIndex == index
                ? const Color(0xFFEFF3EE)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(
              16, // 16
            )),
        child: Text(
          categories[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selectedIndex == index
                ? kPrimaryColor
                : const Color(0xFFC2C2B5),
          ),
        ),
      ),
    );
  }
}
