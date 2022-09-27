import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  String id;
  String username;
  String description;
  int posts;
  int following;
  int followers;
  List<String> listField;
  UserModel({
    required this.id,
    required this.username,
    required this.description,
    required this.posts,
    required this.following,
    required this.followers,
    required this.listField,
  });

  UserModel copyWith({
    String? id,
    String? username,
    String? description,
    int? posts,
    int? following,
    int? followers,
    List<String>? listField,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      description: description ?? this.description,
      posts: posts ?? this.posts,
      following: following ?? this.following,
      followers: followers ?? this.followers,
      listField: listField ?? this.listField,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'description': description,
      'posts': posts,
      'following': following,
      'followers': followers,
      'listField': listField,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
      description: map['description'] ?? '',
      posts: map['posts']?.toInt() ?? 0,
      following: map['following']?.toInt() ?? 0,
      followers: map['followers']?.toInt() ?? 0,
      listField: List<String>.from(map['listField']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, description: $description, posts: $posts, following: $following, followers: $followers, listField: $listField)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.id == id &&
      other.username == username &&
      other.description == description &&
      other.posts == posts &&
      other.following == following &&
      other.followers == followers &&
      listEquals(other.listField, listField);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      username.hashCode ^
      description.hashCode ^
      posts.hashCode ^
      following.hashCode ^
      followers.hashCode ^
      listField.hashCode;
  }
}
