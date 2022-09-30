import 'dart:convert';

class LiveCardModel {
  final String id;
  final String idAccount;
  final String image;
  final bool statusLive;
  final int numberViewer;
  LiveCardModel({
    required this.id,
    required this.idAccount,
    required this.image,
    required this.statusLive,
    required this.numberViewer,
  });

  LiveCardModel copyWith({
    String? id,
    String? idAccount,
    String? image,
    bool? statusLive,
    int? numberViewer,
  }) {
    return LiveCardModel(
      id: id ?? this.id,
      idAccount: idAccount ?? this.idAccount,
      image: image ?? this.image,
      statusLive: statusLive ?? this.statusLive,
      numberViewer: numberViewer ?? this.numberViewer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idAccount': idAccount,
      'image': image,
      'statusLive': statusLive,
      'numberViewer': numberViewer,
    };
  }

  factory LiveCardModel.fromMap(Map<String, dynamic> map) {
    return LiveCardModel(
      id: map['id'] ?? '',
      idAccount: map['idAccount'] ?? '',
      image: map['image'] ?? '',
      statusLive: map['statusLive'] ?? false,
      numberViewer: map['numberViewer']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory LiveCardModel.fromJson(String source) =>
      LiveCardModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LiveCardModel(id: $id, idAccount: $idAccount, image: $image, statusLive: $statusLive, numberViewer: $numberViewer)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LiveCardModel &&
        other.id == id &&
        other.idAccount == idAccount &&
        other.image == image &&
        other.statusLive == statusLive &&
        other.numberViewer == numberViewer;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        idAccount.hashCode ^
        image.hashCode ^
        statusLive.hashCode ^
        numberViewer.hashCode;
  }
}
