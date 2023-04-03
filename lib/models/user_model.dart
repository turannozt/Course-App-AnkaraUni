import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String profImage;
  final String username;
  final String password;
  final String token;

  const User({

    required this.token,
    required this.username,
    required this.password,
    required this.uid,
    required this.profImage,
    required this.email,

  });
  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
 
      token: snapshot["token"],
      username: snapshot["username"],
      uid: snapshot["uid"],
      password: snapshot["password"],
      email: snapshot["email"],
      profImage: snapshot["profImage"],

    );
  }

  Map<String, dynamic> toJson() => {

        "token": token,
        "username": username,
        "password": password,
        "uid": uid,
        "email": email,
        "profImage": profImage,

      };
}
