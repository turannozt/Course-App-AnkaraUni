import 'package:ankarauni/resources/firestore_methods.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class CardDetailsWidget extends StatefulWidget {
  const CardDetailsWidget({
    super.key,
    required this.cardId,
    required this.postUrl,
    required this.description,
    required this.elementName,
    required this.datePublished,
  });
  final String cardId;
  final String postUrl;
  final String description;
  final String elementName;
  final DateTime datePublished;
  @override
  State<CardDetailsWidget> createState() => _CardDetailsWidgetState();
}

class _CardDetailsWidgetState extends State<CardDetailsWidget> {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  void favorite() {
    FireStoreMethods().deleteUnFavori(uid, widget.cardId);
    FireStoreMethods().favoriteCard(
      uid,
      widget.postUrl,
      widget.description,
      widget.cardId,
      widget.elementName,
      widget.datePublished
    );
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: '${widget.elementName} Adlı Kartınız Favorilere Eklendi!',
        message: 'İşleminiz Başarıyla Gerçekleşti',
        contentType: ContentType.success,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void unFavorite() {
    FireStoreMethods().deleteFavori(uid, widget.cardId);
    FireStoreMethods().unfavoriteCard(
      uid,
      widget.postUrl,
      widget.description,
      widget.cardId,
      widget.elementName,
      widget.datePublished
    );
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: '${widget.elementName} Adlı Kartınız Favorilerden Çıkarıldı!',
        message: 'İşleminiz Başarıyla Gerçekleşti',
        contentType: ContentType.success,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              width: double.infinity,
              height: 350,
              child: GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    widget.postUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Column(
                  children: [
                    Text(
                      widget.description,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        wordSpacing: 1,
                        letterSpacing: 0.5,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Image.asset('assets/images/close.png'),
              onPressed: unFavorite,
            ),
            IconButton(
              icon: Image.asset('assets/images/tick-mark.png'),
              onPressed: favorite,
            ),
          ],
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
        widget.elementName,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
