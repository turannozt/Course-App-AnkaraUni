// ignore_for_file: use_build_context_synchronously

import 'package:ankarauni/resources/auth_methods.dart';
import 'package:ankarauni/screens/levels/savecard/favorite_card.dart';
import 'package:ankarauni/screens/levels/savecard/un_favorite_card.dart';
import 'package:ankarauni/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'profile_menu_item.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ProfileMenuItem(
            iconSrc: "assets/images/unfavorite.png",
            title: "Öğrendiğim Kartlar",
            press: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FavoriteCard(),
              ),
            ),
          ),
          ProfileMenuItem(
            iconSrc: "assets/images/favorite.png",
            title: "Öğrenemediğim Kartlar",
            press: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UnFavoriteCard(),
              ),
            ),
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/logout.png",
            title: "Çıkış Yap",
            press: () async {
              await AuthMethods().signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
