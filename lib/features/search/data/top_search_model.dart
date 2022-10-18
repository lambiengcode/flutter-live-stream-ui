// Dart imports:
import 'dart:convert';

class TopSearch {
  String nameStreamer;
  int stt;
  TopSearch({
    required this.nameStreamer,
    required this.stt,
  });

  TopSearch copyWith({
    String? nameStreamer,
    int? stt,
  }) {
    return TopSearch(
      nameStreamer: nameStreamer ?? this.nameStreamer,
      stt: stt ?? this.stt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nameStreamer': nameStreamer,
      'stt': stt,
    };
  }

  factory TopSearch.fromMap(Map<String, dynamic> map) {
    return TopSearch(
      nameStreamer: map['nameStreamer'] ?? '',
      stt: map['stt']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TopSearch.fromJson(String source) =>
      TopSearch.fromMap(json.decode(source));

  @override
  String toString() => 'TopSearch(nameStreamer: $nameStreamer, stt: $stt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TopSearch &&
        other.nameStreamer == nameStreamer &&
        other.stt == stt;
  }

  @override
  int get hashCode => nameStreamer.hashCode ^ stt.hashCode;
}
