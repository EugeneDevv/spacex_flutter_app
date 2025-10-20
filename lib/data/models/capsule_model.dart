// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';


part 'capsule_model.freezed.dart';
part 'capsule_model.g.dart';


@freezed
class CapsuleModel with _$CapsuleModel {
  const CapsuleModel._(); // Private constructor for custom methods like toEntity

  const factory CapsuleModel({
    String? id,
    String? status,
    String? type,
    @JsonKey(name: 'reuse_count') int? reuseCount,
  }) = _CapsuleModel;

  factory CapsuleModel.fromJson(Map<String, dynamic> json) =>
      _$CapsuleModelFromJson(json);

}
