// ignore_for_file: unrelated_type_equality_checks
import 'package:ankarauni/models/level_details.dart';
import 'package:ankarauni/screens/levels/orta/level_details_b1.dart';
import 'package:flutter/material.dart';

class OrtaSeviye extends StatefulWidget {
  const OrtaSeviye({super.key});

  @override
  State<OrtaSeviye> createState() => _OrtaSeviyeState();
}

class _OrtaSeviyeState extends State<OrtaSeviye> {
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
            itemBuilder: (context, index) => LevelDetailsCardB1(
              levelDetailsB1: levelDetailsB1[index],
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
        'Orta Seviye',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
