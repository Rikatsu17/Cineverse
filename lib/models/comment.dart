import 'package:cloud_firestore/cloud_firestore.dart';

class MovieComment {
  MovieComment({
    required this.email,
    required this.text,
    required this.date,
    this.reference,
  });

  final String email;
  final String text;
  final DateTime date;

  DocumentReference? reference;

  factory MovieComment.fromJson(
      Map<String, dynamic> json,
      ) {
    return MovieComment(
      email: json['email'] as String,

      text: json['text'] as String,

      date:
      (json['date'] as Timestamp)
          .toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'text': text,
      'date': date,
    };
  }

  factory MovieComment.fromSnapshot(
      DocumentSnapshot snapshot,
      ) {
    final comment =
    MovieComment.fromJson(
      snapshot.data()
      as Map<String, dynamic>,
    );

    comment.reference =
        snapshot.reference;

    return comment;
  }
}