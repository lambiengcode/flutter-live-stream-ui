import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:streamskit_mobile/features/profile/data/live_card_model.dart';

class ListLiveCardModel {
  final int type; // 1: Live Stream // 2: LastLive // 3: STar // 4 Posts
  final List<LiveCardModel> listLiveCardModel;
  ListLiveCardModel({
    required this.type,
    required this.listLiveCardModel,
  });

  ListLiveCardModel copyWith({
    int? type,
    List<LiveCardModel>? listLiveCardModel,
  }) {
    return ListLiveCardModel(
      type: type ?? this.type,
      listLiveCardModel: listLiveCardModel ?? this.listLiveCardModel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'listLiveCardModel': listLiveCardModel.map((x) => x.toMap()).toList(),
    };
  }

  factory ListLiveCardModel.fromMap(Map<String, dynamic> map) {
    return ListLiveCardModel(
      type: map['type']?.toInt() ?? 0,
      listLiveCardModel: List<LiveCardModel>.from(
          map['listLiveCardModel']?.map((x) => LiveCardModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListLiveCardModel.fromJson(String source) =>
      ListLiveCardModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ListLiveCardModel(type: $type, listLiveCardModel: $listLiveCardModel)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListLiveCardModel &&
        other.type == type &&
        listEquals(other.listLiveCardModel, listLiveCardModel);
  }

  @override
  int get hashCode => type.hashCode ^ listLiveCardModel.hashCode;
}
