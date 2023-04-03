// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String nameSurname;
  final String postId;
  final String postUrl;
  final DateTime datePublished;
  final String level;
  final String elementName;

  const Post({
    required this.datePublished,
    required this.elementName,
    required this.level,
    required this.description,
    required this.uid,
    required this.nameSurname,
    required this.postId,
    required this.postUrl,
  });

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      datePublished: snapshot["datePublished"],
      elementName: snapshot["elementName"],
      level: snapshot["level"],
      description: snapshot["description"],
      uid: snapshot["uid"],
      postId: snapshot["postId"],
      nameSurname: snapshot["nameSurname"],
      postUrl: snapshot['postUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
        "datePublished": datePublished,
        "elementName": elementName,
        "level": level,
        "description": description,
        "uid": uid,
        "nameSurname": nameSurname,
        "postId": postId,
        'postUrl': postUrl,
      };
}
