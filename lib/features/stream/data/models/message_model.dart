import 'dart:convert';

class MessageModel {
  final String imageUrl;
  final String fullName;
  final String message;
  MessageModel({
    required this.imageUrl,
    required this.fullName,
    required this.message,
  });

  MessageModel copyWith({
    String? imageUrl,
    String? fullName,
    String? message,
  }) {
    return MessageModel(
      imageUrl: imageUrl ?? this.imageUrl,
      fullName: fullName ?? this.fullName,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'fullName': fullName,
      'message': message,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      imageUrl: map['imageUrl'] ?? '',
      fullName: map['fullName'] ?? '',
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'MessageModel(imageUrl: $imageUrl, fullName: $fullName, message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessageModel &&
        other.imageUrl == imageUrl &&
        other.fullName == fullName &&
        other.message == message;
  }

  @override
  int get hashCode => imageUrl.hashCode ^ fullName.hashCode ^ message.hashCode;
}
