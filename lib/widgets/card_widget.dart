// ignore_for_file: prefer_typing_uninitialized_variables, unrelated_type_equality_checks

import 'package:ankarauni/resources/firestore_methods.dart';
import 'package:ankarauni/widgets/card_details_widget.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key, this.snap});
  final snap;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  _showMyDialog(VoidCallback onClick) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Emin msiniz ?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Seçili Kartınız Silinecek'),
                Text('Onaylıyor Musunuz ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('İptal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              onPressed: onClick,
              child: const Text('Onaylıyorum'),
            ),
          ],
        );
      },
    );
  }

  void deleteCard() {
    FireStoreMethods().deleteCard(
      widget.snap['postId'],
      uid,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CardDetailsWidget(
            datePublished: widget.snap['datePublished'].toDate(),
            elementName: widget.snap['elementName'],
            postUrl: widget.snap['postUrl'],
            description: widget.snap['description'],
            cardId: widget.snap['postId'],
          ),
        ),
      ),
      onLongPress: () => _showMyDialog(() {
        deleteCard();
        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: '${widget.snap['elementName']} Adlı Kartınız Silindi!',
            message: 'İşleminiz Başarıyla Gerçekleşti',
            contentType: ContentType.success,
          ),
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
        Navigator.pop(context);
      }),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(
                  color: Colors.blueGrey,
                  blurRadius: 3,
                  offset: Offset(2, 4), // Shadow position
                ),
              ],
            ),
            width: 100,
            height: 100,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.snap['postUrl']),
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            widget.snap['elementName'],
            style: GoogleFonts.openSans(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )
          // baslık
        ],
      ),
    );
  }
}
