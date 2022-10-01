import 'dart:convert';

import 'package:flutter/material.dart';

class LiveCardModel {
  final String id;
  final String idAccount;
  final String image;
  final bool statusLive;
  final int numberViewer;
  final int categoryLive;
  LiveCardModel({
    required this.id,
    required this.idAccount,
    required this.image,
    required this.statusLive,
    required this.numberViewer,
    required this.categoryLive,
  });

  String get getTitleType {
    switch (categoryLive) {
      case 1:
        return 'Game';
      case 2:
        return 'Review';
      case 3:
        return 'Music';
      case 4:
        return 'Talk';
    }
    return '';
  }

  Color get getColorType {
    switch (categoryLive) {
      case 1:
        return Colors.redAccent;
      case 2:
        return Colors.purpleAccent;
      case 3:
        return Colors.blueAccent;
      case 4:
        return Colors.orangeAccent;
    }
    return Colors.redAccent;
  }

  LiveCardModel copyWith({
    String? id,
    String? idAccount,
    String? image,
    bool? statusLive,
    int? numberViewer,
    int? categoryLive,
  }) {
    return LiveCardModel(
      id: id ?? this.id,
      idAccount: idAccount ?? this.idAccount,
      image: image ?? this.image,
      statusLive: statusLive ?? this.statusLive,
      numberViewer: numberViewer ?? this.numberViewer,
      categoryLive: categoryLive ?? this.categoryLive,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idAccount': idAccount,
      'image': image,
      'statusLive': statusLive,
      'numberViewer': numberViewer,
      'categoryLive': categoryLive,
    };
  }

  factory LiveCardModel.fromMap(Map<String, dynamic> map) {
    return LiveCardModel(
      id: map['id'] ?? '',
      idAccount: map['idAccount'] ?? '',
      image: map['image'] ?? '',
      statusLive: map['statusLive'] ?? false,
      numberViewer: map['numberViewer']?.toInt() ?? 0,
      categoryLive: map['categoryLive']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory LiveCardModel.fromJson(String source) =>
      LiveCardModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LiveCardModel(id: $id, idAccount: $idAccount, image: $image, statusLive: $statusLive, numberViewer: $numberViewer, categoryLive: $categoryLive)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LiveCardModel &&
        other.id == id &&
        other.idAccount == idAccount &&
        other.image == image &&
        other.statusLive == statusLive &&
        other.numberViewer == numberViewer &&
        other.categoryLive == categoryLive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        idAccount.hashCode ^
        image.hashCode ^
        statusLive.hashCode ^
        numberViewer.hashCode ^
        categoryLive.hashCode;
  }
}
