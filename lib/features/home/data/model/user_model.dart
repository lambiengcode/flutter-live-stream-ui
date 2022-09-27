import 'dart:convert';

class UserModel {
  final String fullName;
  final String urlToImage;
  UserModel({
    required this.fullName,
    required this.urlToImage,
  });

  UserModel copyWith({
    String? fullName,
    String? urlToImage,
  }) {
    return UserModel(
      fullName: fullName ?? this.fullName,
      urlToImage: urlToImage ?? this.urlToImage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'urlToImage': urlToImage,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullName: map['fullName'] ?? '',
      urlToImage: map['urlToImage'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserModel(fullName: $fullName, urlToImage: $urlToImage)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.fullName == fullName &&
        other.urlToImage == urlToImage;
  }

  @override
  int get hashCode => fullName.hashCode ^ urlToImage.hashCode;
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