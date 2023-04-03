import 'package:ankarauni/screens/levels/add_lvl_card.dart';
import 'package:ankarauni/utils/constants.dart';
import 'package:ankarauni/widgets/card_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class A2Screen extends StatefulWidget {
  const A2Screen({super.key});

  @override
  State<A2Screen> createState() => _A2ScreenState();
}

class _A2ScreenState extends State<A2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kTextLigntColor,
        heroTag: 'uniqueTag',
        label: Row(
          children: const [
            Icon(Icons.card_membership),
            SizedBox(width: 5),
            Text('Kart Ekle'),
          ],
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddCardScreen(),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('cards')
            .where('level', isEqualTo: 'a2-lvl')
            .orderBy('datePublished', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.builder(
            shrinkWrap: true,
            itemCount: (snapshot.data! as dynamic).docs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 0,
              mainAxisSpacing: 1.5,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return CardWidget(
                snap: snapshot.data!.docs[index].data(),
              );
            },
          );
        },
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
        'A2 Seviye Kartları',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
