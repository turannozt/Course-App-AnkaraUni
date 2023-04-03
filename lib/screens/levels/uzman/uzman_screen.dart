// ignore_for_file: unrelated_type_equality_checks

import 'package:ankarauni/models/level_details.dart';
import 'package:ankarauni/screens/levels/uzman/level_details_c1.dart';
import 'package:flutter/material.dart';

class UzmanSeviye extends StatefulWidget {
  const UzmanSeviye({super.key});

  @override
  State<UzmanSeviye> createState() => _UzmanSeviyeState();
}

class _UzmanSeviyeState extends State<UzmanSeviye> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
       body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            itemCount: levelDetailsC1.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1 == Orientation.landscape ? 2 : 1,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10 == Orientation.landscape ? 20 : 0,
              childAspectRatio: 1.65,
            ),
            itemBuilder: (context, index) => LevelDetailsCardC1(
              levelDetailsC1: levelDetailsC1[index],
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
        'Uzman Seviye',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
