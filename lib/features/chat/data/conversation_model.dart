import 'dart:convert';

class ConversationModel {
  final String fullName;
  final String lastMessage;
  final String urlUserImage;
  final DateTime createdAt;
  final int countUnreadMessage;
  final bool isSeen;
  ConversationModel({
    required this.fullName,
    required this.lastMessage,
    required this.urlUserImage,
    required this.createdAt,
    required this.countUnreadMessage,
    required this.isSeen,
  });

  ConversationModel copyWith(
      {String? fullName,
      String? lastMessage,
      String? urlUserImage,
      DateTime? createdAt,
      int? countUnreadMessage,
      bool? isSeen}) {
    return ConversationModel(
      fullName: fullName ?? this.fullName,
      lastMessage: lastMessage ?? this.lastMessage,
      urlUserImage: urlUserImage ?? this.urlUserImage,
      createdAt: createdAt ?? this.createdAt,
      countUnreadMessage: countUnreadMessage ?? this.countUnreadMessage,
      isSeen: isSeen ?? this.isSeen,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'lastMessage': lastMessage,
      'urlUserImage': urlUserImage,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'countUnreadMessage': countUnreadMessage,
      'isSeen': isSeen,
    };
  }

  factory ConversationModel.fromMap(Map<String, dynamic> map) {
    return ConversationModel(
        fullName: map['fullName'] ?? '',
        lastMessage: map['lastMessage'] ?? '',
        urlUserImage: map['urlUserImage'] ?? '',
        createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
        countUnreadMessage: map['countUnreadMessage']?.toInt() ?? 0,
        isSeen: map['isSeen'] ?? false);
  }

  String toJson() => json.encode(toMap());

  factory ConversationModel.fromJson(String source) =>
      ConversationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ConversationModel(fullName: $fullName, lastMessage: $lastMessage, urlUserImage: $urlUserImage, createdAt: $createdAt, countUnreadMessage: $countUnreadMessage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ConversationModel &&
        other.fullName == fullName &&
        other.lastMessage == lastMessage &&
        other.urlUserImage == urlUserImage &&
        other.createdAt == createdAt &&
        other.countUnreadMessage == countUnreadMessage &&
        other.isSeen == isSeen;
  }

  @override
  int get hashCode {
    return fullName.hashCode ^
        lastMessage.hashCode ^
        urlUserImage.hashCode ^
        createdAt.hashCode ^
        countUnreadMessage.hashCode ^
        isSeen.hashCode;
  }
}

List<ConversationModel> conversationFake = [
  ConversationModel(
      fullName: 'Long Tứ',
      lastMessage: 'Đánh bài không :))',
      urlUserImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShD1rBYj3o7UoD5vBdtlgAVcLh3bq-kAjwFw&usqp=CAU',
      createdAt: DateTime.now(),
      countUnreadMessage: 2,
      isSeen: true),
  ConversationModel(
      fullName: 'Thánh Đỗ',
      lastMessage: 'Live Stream game đi anh ei!!!',
      urlUserImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvpUqkQzykHU3Jr8v9yhGkSbhL18lGd3ObzQ&usqp=CAU',
      createdAt: DateTime.now(),
      countUnreadMessage: 3,
      isSeen: true),
  ConversationModel(
      fullName: 'Kẻ bí Ẩn',
      lastMessage: 'Live Stream lẹ đi',
      urlUserImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfaZBAHVPJ6xRNWZqOH_zxfa5YpSqdcdxiVw&usqp=CAU',
      createdAt: DateTime.now(),
      countUnreadMessage: 6,
      isSeen: false),
  ConversationModel(
      fullName: 'Kẻ bí Ẩn',
      lastMessage: 'Live Stream lẹ đi',
      urlUserImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfaZBAHVPJ6xRNWZqOH_zxfa5YpSqdcdxiVw&usqp=CAU',
      createdAt: DateTime.now(),
      countUnreadMessage: 6,
      isSeen: false),
  ConversationModel(
      fullName: 'Kẻ bí Ẩn',
      lastMessage: 'Live Stream lẹ đi',
      urlUserImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfaZBAHVPJ6xRNWZqOH_zxfa5YpSqdcdxiVw&usqp=CAU',
      createdAt: DateTime.now(),
      countUnreadMessage: 6,
      isSeen: false),
  ConversationModel(
      fullName: 'Kẻ bí Ẩn',
      lastMessage: 'Live Stream lẹ đi',
      urlUserImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfaZBAHVPJ6xRNWZqOH_zxfa5YpSqdcdxiVw&usqp=CAU',
      createdAt: DateTime.now(),
      countUnreadMessage: 6,
      isSeen: true),
  ConversationModel(
      fullName: 'Kẻ bí Ẩn',
      lastMessage: 'Live Stream lẹ đi',
      urlUserImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfaZBAHVPJ6xRNWZqOH_zxfa5YpSqdcdxiVw&usqp=CAU',
      createdAt: DateTime.now(),
      countUnreadMessage: 6,
      isSeen: true),
  ConversationModel(
      fullName: 'Kẻ bí Ẩn',
      lastMessage: 'Live Stream lẹ đi',
      urlUserImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfaZBAHVPJ6xRNWZqOH_zxfa5YpSqdcdxiVw&usqp=CAU',
      createdAt: DateTime.now(),
      countUnreadMessage: 6,
      isSeen: true),
];
