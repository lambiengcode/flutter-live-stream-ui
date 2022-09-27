import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  String? id;
  final String fullName;
  final String urlToImage;
  String? description;
  int? posts;
  int? followings;
  int? followers;
  List<String>? listFields;
  UserModel({
    this.id,
    required this.fullName,
    required this.urlToImage,
    this.description,
    this.posts,
    this.followings,
    this.followers,
     this.listFields,
  });

  UserModel copyWith({
    String? id,
    String? fullName,
    String? urlToImage,
    String? description,
    int? posts,
    int? followings,
    int? followers,
    List<String>? listFields,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      urlToImage: urlToImage ?? this.urlToImage,
      description: description ?? this.description,
      posts: posts ?? this.posts,
      followings: followings ?? this.followings,
      followers: followers ?? this.followers,
      listFields: listFields ?? this.listFields,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'urlToImage': urlToImage,
      'description': description,
      'posts': posts,
      'followings': followings,
      'followers': followers,
      'listFields': listFields,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      fullName: map['fullName'] ?? '',
      urlToImage: map['urlToImage'] ?? '',
      description: map['description'] ?? '',
      posts: map['posts']?.toInt() ?? 0,
      followings: map['followings']?.toInt() ?? 0,
      followers: map['followers']?.toInt() ?? 0,
      listFields: List<String>.from(map['listFields']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, fullName: $fullName, urlToImage: $urlToImage, description: $description, posts: $posts, followings: $followings, followers: $followers, listFields: $listFields)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.fullName == fullName &&
        other.urlToImage == urlToImage &&
        other.description == description &&
        other.posts == posts &&
        other.followings == followings &&
        other.followers == followers &&
        listEquals(other.listFields, listFields);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullName.hashCode ^
        urlToImage.hashCode ^
        description.hashCode ^
        posts.hashCode ^
        followings.hashCode ^
        followers.hashCode ^
        listFields.hashCode;
  }
}

List<UserModel> listUserFake = [
  UserModel(fullName: 'Brody', urlToImage: urlUserFake3),
  UserModel(fullName: 'Johnny', urlToImage: urlUserFake2),
  UserModel(fullName: 'Caroline', urlToImage: urlUserFake),
  UserModel(fullName: 'Jerry', urlToImage: urlUserFake2),
  UserModel(fullName: 'Tommy', urlToImage: urlUserFake),
  UserModel(fullName: 'Cris', urlToImage: urlUserFake2),
];

const urlUserFake =
    'https://images.unsplash.com/photo-1559969143-b2defc6419fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Z2FtZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60';
const urlUserFake2 =
    'https://images.unsplash.com/photo-1534488972407-5a4aa1e47d83?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Z2FtZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60';
const urlUserFake3 =
    'https://images.unsplash.com/photo-1610041321420-a596dd14ebc9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGdhbWVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60';
