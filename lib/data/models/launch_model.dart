// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spacex_flutter_app/domain/entities/launch_entity.dart';

part 'launch_model.freezed.dart';
part 'launch_model.g.dart';

// ------------------------------------
// NESTED MODELS (must be defined as Freezed classes)
// ------------------------------------

@freezed
class LaunchSiteModel with _$LaunchSiteModel {
  const factory LaunchSiteModel({
    @JsonKey(name: 'site_name_long') String? siteNameLong,
  }) = _LaunchSiteModel;

  factory LaunchSiteModel.fromJson(Map<String, dynamic> json) =>
      _$LaunchSiteModelFromJson(json);
}

@freezed
class RocketModel with _$RocketModel {
  const factory RocketModel({
    @JsonKey(name: 'rocket_name') String? rocketName,
  }) = _RocketModel;

  factory RocketModel.fromJson(Map<String, dynamic> json) =>
      _$RocketModelFromJson(json);
}

@freezed
class LinksModel with _$LinksModel {
  const factory LinksModel({
    @JsonKey(name: 'mission_patch_small') String? missionPatchSmall,
    @JsonKey(name: 'article_link') String? articleLink,
    @JsonKey(name: 'video_link') String? videoLink,
  }) = _LinksModel;

  factory LinksModel.fromJson(Map<String, dynamic> json) =>
      _$LinksModelFromJson(json);
}

@freezed
class ShipModel with _$ShipModel {
  const factory ShipModel({
    String? abs,
    required bool active,
    @JsonKey(name: 'attempted_landings') int? attemptedLandings,
    @JsonKey(name: 'successful_landings') int? successfulLandings,
    String? image,
    String? url,
  }) = _ShipModel;

  factory ShipModel.fromJson(Map<String, dynamic> json) =>
      _$ShipModelFromJson(json);
}

// ------------------------------------
// MAIN LAUNCH MODEL
// ------------------------------------

@freezed
class LaunchModel with _$LaunchModel {
  const LaunchModel._(); // Private constructor for custom methods like toEntity

  const factory LaunchModel({
    required String id,
    @JsonKey(name: 'mission_name') String? missionName,
    @JsonKey(name: 'launch_date_utc') String? launchDateUtc,
    @JsonKey(name: 'launch_date_local') String? launchDateLocal,
    @JsonKey(name: 'launch_site') LaunchSiteModel? launchSite,
    RocketModel? rocket,
    LinksModel? links,
    @JsonKey(name: 'is_tentative') bool? isTentative,
    @JsonKey(name: 'launch_success') bool? launchSuccess,
    @JsonKey(name: 'launch_year') String? launchYear,
    @JsonKey(name: 'mission_id') @Default([]) List<String>? missionIds,
    @Default([]) List<ShipModel> ships,
  }) = _LaunchModel;

  factory LaunchModel.fromJson(Map<String, dynamic> json) =>
      _$LaunchModelFromJson(json);

  DateTime? get launchDateUtcEntity {
    if (launchDateUtc?.isEmpty ?? true) return null;
    return DateTime.tryParse(launchDateUtc ?? '');
  }

  // Conversion from Model to clean Domain Entity
  LaunchEntity toEntity() {
    return LaunchEntity(
      id: id,
      missionName: missionName ?? '',
      launchDateUtc: launchDateUtcEntity,
      launchSiteName: launchSite?.siteNameLong ?? '',
      rocketName: rocket?.rocketName ?? '',
      missionPatchUrl: links?.missionPatchSmall,
      articleLink: links?.articleLink,
      videoLink: links?.videoLink,
      isTentative: isTentative ?? false,
      launchSuccess: launchSuccess,
      launchYear: launchYear ?? '',
      shipCount: ships.length,
    );
  }
}
