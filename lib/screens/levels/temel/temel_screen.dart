// ignore_for_file: unrelated_type_equality_checks

import 'package:ankarauni/models/level_details.dart';
import 'package:ankarauni/screens/home/components/level_details_card.dart';
import 'package:flutter/material.dart';

class TemelSeviye extends StatefulWidget {
  const TemelSeviye({super.key});

  @override
  State<TemelSeviye> createState() => _TemelSeviyeState();
}

class _TemelSeviyeState extends State<TemelSeviye> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            itemCount: levelDetailsA1.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1 == Orientation.landscape ? 2 : 1,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10 == Orientation.landscape ? 20 : 0,
              childAspectRatio: 1.65,
            ),
            itemBuilder: (context, index) => LevelDetailsCard(
              levelDetailsA1: levelDetailsA1[index],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      // On Android by default its false
      centerTitle: true,
      title: Text(
        'Temel Seviye',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
