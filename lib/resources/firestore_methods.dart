import 'dart:typed_data';
import 'package:ankarauni/models/post.dart';
import 'package:ankarauni/resources/storage_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //  upload post to Firestore
  Future<String> uploadCard(String description, Uint8List file, String uid,
      String nameSurname, String level, String elementName) async {
    // asking uid here because we dont want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      String postUrl =
          await StorageMethods().uploadImageToStorage('cards', file, true);

      String postId = const Uuid().v1(); // creates unique id based on time
      Post post = Post(
        datePublished: DateTime.now(),
        elementName: elementName,
        level: level,
        description: description,
        uid: uid,
        nameSurname: nameSurname,
        postId: postId,
        postUrl: postUrl,
      );
      _firestore.collection('cards').doc(postId).set(post.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Delete Post
  Future<String> deleteCard(String postId, String uid) async {
    String res = "Some error occurred";
    try {
      await _firestore.collection('cards').doc(postId).delete();
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('favoriteCard')
          .doc(postId)
          .delete();
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('unfavoriteCard')
          .doc(postId)
          .delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  

  Future<String> favoriteCard(
    String uid,
    String postUrl,
    String description,
    String postId,
    String elementName,
    DateTime datePublished,
  ) async {
    String res = "error";
    try {
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('favoriteCard')
          .doc(postId)
          .set({
        "uid": uid,
        "postUrl": postUrl,
        "description": description,
        "postId": postId,
        "elementName": elementName,
        "datePublished": datePublished,
      });

      res = "success";
    } catch (e) {
      e.toString();
    }
    return res;
  }

  Future<String> unfavoriteCard(
    String uid,
    String postUrl,
    String description,
    String postId,
    String elementName,
    DateTime datePublished,
  ) async {
    String res = "error";
    try {
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('unfavoriteCard')
          .doc(postId)
          .set({
        "uid": uid,
        "postUrl": postUrl,
        "description": description,
        "postId": postId,
        "datePublished": datePublished,
        "elementName": elementName,
      });

      res = "success";
    } catch (e) {
      e.toString();
    }
    return res;
  }

  Future<String> deleteFavori(String uid, String postId) async {
    String res = "error";
    try {
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('favoriteCard')
          .doc(postId)
          .delete();
      res = "success";
    } catch (e) {
      e.toString();
    }
    return res;
  }

  Future<String> deleteUnFavori(String uid, String postId) async {
    String res = "error";
    try {
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('unfavoriteCard')
          .doc(postId)
          .delete();

      res = "success";
    } catch (e) {
      e.toString();
    }
    return res;
  }
}
