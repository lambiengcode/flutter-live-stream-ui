// Dart imports:
import 'dart:convert';

class SocialValue {
  final String fullName;
  final String? facebookId;
  final String? googleId;
  final String? appleId;
  SocialValue({
    required this.fullName,
    this.facebookId,
    this.googleId,
    this.appleId,
  });

  SocialValue copyWith({
    String? fullName,
    String? email,
    String? facebookId,
    String? googleId,
    String? appleId,
  }) {
    return SocialValue(
      fullName: fullName ?? this.fullName,
      facebookId: facebookId ?? this.facebookId,
      googleId: googleId ?? this.googleId,
      appleId: appleId ?? this.appleId,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = {
      'fullName': fullName,
    };

    if (googleId != null) {
      result['credentialId'] = googleId!;
      result['socialType'] = 0;
    }

    if (appleId != null) {
      result['credentialId'] = appleId!;
      result['socialType'] = 2;
    }

    if (facebookId != null) {
      result['credentialId'] = facebookId!;
      result['socialType'] = 1;
    }

    return result;
  }

  factory SocialValue.fromMap(Map<String, dynamic> map) {
    return SocialValue(
      fullName: map['fullName'] ?? '',
      facebookId: map['facebookId'],
      googleId: map['googleId'],
      appleId: map['appleId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialValue.fromJson(String source) =>
      SocialValue.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SocialModel(fullName: $fullName, facebookId: $facebookId, googleId: $googleId, appleId: $appleId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SocialValue &&
        other.fullName == fullName &&
        other.facebookId == facebookId &&
        other.googleId == googleId &&
        other.appleId == appleId;
  }

  @override
  int get hashCode {
    return fullName.hashCode ^
        facebookId.hashCode ^
        googleId.hashCode ^
        appleId.hashCode;
  }
}
