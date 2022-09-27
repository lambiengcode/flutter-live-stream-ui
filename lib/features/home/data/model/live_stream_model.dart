// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class LiveStreamModel {
  final int peopleParticipant;
  final int type;
  final String urlToImage;
  LiveStreamModel({
    required this.peopleParticipant,
    required this.type,
    required this.urlToImage,
  });

  LiveStreamModel copyWith({
    int? peopleParticipant,
    int? type,
    String? urlToImage,
  }) {
    return LiveStreamModel(
      peopleParticipant: peopleParticipant ?? this.peopleParticipant,
      type: type ?? this.type,
      urlToImage: urlToImage ?? this.urlToImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'peopleParticipant': peopleParticipant,
      'type': type,
      'urlToImage': urlToImage,
    };
  }

  factory LiveStreamModel.fromMap(Map<String, dynamic> map) {
    return LiveStreamModel(
      peopleParticipant: map['peopleParticipant'] as int,
      type: map['type'] as int,
      urlToImage: map['urlToImage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LiveStreamModel.fromJson(String source) =>
      LiveStreamModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LiveStreamModel(peopleParticipant: $peopleParticipant, type: $type, urlToImage: $urlToImage)';

  @override
  bool operator ==(covariant LiveStreamModel other) {
    if (identical(this, other)) return true;

    return other.peopleParticipant == peopleParticipant &&
        other.type == type &&
        other.urlToImage == urlToImage;
  }

  @override
  int get hashCode =>
      peopleParticipant.hashCode ^ type.hashCode ^ urlToImage.hashCode;

  String get getTitleType {
    switch (type) {
      case 1:
        return 'Game';
      case 2:
        return 'Review';
      case 3:
        return 'Music';
    }
    return '';
  }

  Color get getColorType {
    switch (type) {
      case 1:
        return Colors.redAccent;
      case 2:
        return Colors.purpleAccent;
      case 3:
        return Colors.blueAccent;
    }
    return Colors.redAccent;
  }
}

List<LiveStreamModel> listLiveStreamFake = [
  LiveStreamModel(peopleParticipant: 910, type: 1, urlToImage: urlImageGame),
  LiveStreamModel(peopleParticipant: 910, type: 2, urlToImage: urlImageReview),
  LiveStreamModel(peopleParticipant: 910, type: 3, urlToImage: urlImageMusic),
  LiveStreamModel(peopleParticipant: 910, type: 2, urlToImage: urlImageReview),
  LiveStreamModel(peopleParticipant: 910, type: 3, urlToImage: urlImageMusic),
  LiveStreamModel(peopleParticipant: 910, type: 2, urlToImage: urlImageReview),
  LiveStreamModel(peopleParticipant: 910, type: 3, urlToImage: urlImageMusic),
  LiveStreamModel(peopleParticipant: 910, type: 1, urlToImage: urlImageGame),
  LiveStreamModel(peopleParticipant: 910, type: 2, urlToImage: urlImageReview),
  LiveStreamModel(peopleParticipant: 910, type: 1, urlToImage: urlImageGame),
  LiveStreamModel(peopleParticipant: 910, type: 2, urlToImage: urlImageReview),
];

String urlImageGame =
    'https://kenh14cdn.com/2020/10/30/photo-1-1604044340274364328631.png';
String urlImageReview =
    'https://media.istockphoto.com/photos/cybersport-gamer-have-live-stream-picture-id1306424929?k=20&m=1306424929&s=612x612&w=0&h=tN9CafElP0EZHQG4s14zO_Ko0OriOzCt4fOc2q9lQz4=';
String urlImageMusic =
    'https://images.unsplash.com/photo-1653469894816-c517bc3427a7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8bGl2ZXN0cmVhbSUyMG11c2ljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60';
