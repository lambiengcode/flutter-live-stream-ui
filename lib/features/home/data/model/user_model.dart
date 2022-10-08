// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  String? id;
  final String fullName;
  final String urlToImage;
  String? description;
  String? phoneNumber;
  bool gender;
  DateTime? birthday;
  int? posts;
  int? followings;
  int? followers;
  List<String>? listFields;
  bool isLiveStream;
  bool? isExpert;
  UserModel({
    this.id,
    required this.fullName,
    required this.urlToImage,
    this.description,
    this.phoneNumber,
    this.gender = false,
    this.birthday,
    this.posts,
    this.followings,
    this.followers,
    this.listFields,
    this.isLiveStream = false,
    this.isExpert = false,
  });

  UserModel copyWith({
    String? id,
    String? fullName,
    String? urlToImage,
    String? description,
    String? phoneNumber,
    bool? gender,
    DateTime? birthday,
    int? posts,
    int? followings,
    int? followers,
    List<String>? listFields,
    bool? isLiveStream,
    bool? isExpert,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      urlToImage: urlToImage ?? this.urlToImage,
      description: description ?? this.description,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
      posts: posts ?? this.posts,
      followings: followings ?? this.followings,
      followers: followers ?? this.followers,
      listFields: listFields ?? this.listFields,
      isLiveStream: isLiveStream ?? this.isLiveStream,
      isExpert: isExpert ?? this.isExpert,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'urlToImage': urlToImage,
      'description': description,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'birthday': birthday?.millisecondsSinceEpoch,
      'posts': posts,
      'followings': followings,
      'followers': followers,
      'listFields': listFields,
      'isLiveStream': isLiveStream,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      fullName: map['fullName'] ?? '',
      urlToImage: map['urlToImage'] ?? '',
      description: map['description'],
      phoneNumber: map['phoneNumber'],
      gender: map['gender'] ?? false,
      birthday: map['birthday'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['birthday'])
          : null,
      posts: map['posts']?.toInt(),
      followings: map['followings']?.toInt(),
      followers: map['followers']?.toInt(),
      listFields: List<String>.from(map['listFields']),
      isLiveStream: map['isLiveStream'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, fullName: $fullName, urlToImage: $urlToImage, description: $description, phoneNumber: $phoneNumber, gender: $gender, birthday: $birthday, posts: $posts, followings: $followings, followers: $followers, listFields: $listFields, isLiveStream: $isLiveStream)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.fullName == fullName &&
        other.urlToImage == urlToImage &&
        other.description == description &&
        other.phoneNumber == phoneNumber &&
        other.gender == gender &&
        other.birthday == birthday &&
        other.posts == posts &&
        other.followings == followings &&
        other.followers == followers &&
        listEquals(other.listFields, listFields) &&
        other.isLiveStream == isLiveStream;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullName.hashCode ^
        urlToImage.hashCode ^
        description.hashCode ^
        phoneNumber.hashCode ^
        gender.hashCode ^
        birthday.hashCode ^
        posts.hashCode ^
        followings.hashCode ^
        followers.hashCode ^
        listFields.hashCode ^
        isLiveStream.hashCode;
  }
}

List<UserModel> listUserFake = [
  UserModel(fullName: 'Brody', urlToImage: urlUserFake3, isLiveStream: true),
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
