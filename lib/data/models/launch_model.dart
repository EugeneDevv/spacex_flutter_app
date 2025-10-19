import 'package:freezed_annotation/freezed_annotation.dart';

part 'launch_model.freezed.dart';
part 'launch_model.g.dart';

@freezed
abstract class LaunchModel with _$LaunchModel {
  factory LaunchModel({
    String? token,
    String? password,
  }) = _LaunchModel;

  factory LaunchModel.fromJson(Map<String, dynamic> json) =>
      _$LaunchModelFromJson(json);

  factory LaunchModel.initial() => LaunchModel();
}

