// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LaunchSiteModelImpl _$$LaunchSiteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LaunchSiteModelImpl(
      siteNameLong: json['site_name_long'] as String?,
    );

Map<String, dynamic> _$$LaunchSiteModelImplToJson(
        _$LaunchSiteModelImpl instance) =>
    <String, dynamic>{
      'site_name_long': instance.siteNameLong,
    };

_$RocketBudgetModelImpl _$$RocketBudgetModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RocketBudgetModelImpl(
      cost: (json['cost_per_launch'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$RocketBudgetModelImplToJson(
        _$RocketBudgetModelImpl instance) =>
    <String, dynamic>{
      'cost_per_launch': instance.cost,
    };

_$RocketModelImpl _$$RocketModelImplFromJson(Map<String, dynamic> json) =>
    _$RocketModelImpl(
      rocketName: json['rocket_name'] as String?,
      rocket: json['rocket'] == null
          ? null
          : RocketBudgetModel.fromJson(json['rocket'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RocketModelImplToJson(_$RocketModelImpl instance) =>
    <String, dynamic>{
      'rocket_name': instance.rocketName,
      'rocket': instance.rocket,
    };

_$LinksModelImpl _$$LinksModelImplFromJson(Map<String, dynamic> json) =>
    _$LinksModelImpl(
      missionPatchSmall: json['mission_patch_small'] as String?,
      articleLink: json['article_link'] as String?,
      videoLink: json['video_link'] as String?,
    );

Map<String, dynamic> _$$LinksModelImplToJson(_$LinksModelImpl instance) =>
    <String, dynamic>{
      'mission_patch_small': instance.missionPatchSmall,
      'article_link': instance.articleLink,
      'video_link': instance.videoLink,
    };

_$LaunchModelImpl _$$LaunchModelImplFromJson(Map<String, dynamic> json) =>
    _$LaunchModelImpl(
      id: json['id'] as String,
      missionName: json['mission_name'] as String?,
      details: json['details'] as String?,
      launchDateUtc: json['launch_date_utc'] as String?,
      launchDateLocal: json['launch_date_local'] as String?,
      launchSite: json['launch_site'] == null
          ? null
          : LaunchSiteModel.fromJson(
              json['launch_site'] as Map<String, dynamic>),
      rocket: json['rocket'] == null
          ? null
          : RocketModel.fromJson(json['rocket'] as Map<String, dynamic>),
      links: json['links'] == null
          ? null
          : LinksModel.fromJson(json['links'] as Map<String, dynamic>),
      isTentative: json['is_tentative'] as bool?,
      launchSuccess: json['launch_success'] as bool?,
      launchYear: json['launch_year'] as String?,
      missionIds: (json['mission_id'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$LaunchModelImplToJson(_$LaunchModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mission_name': instance.missionName,
      'details': instance.details,
      'launch_date_utc': instance.launchDateUtc,
      'launch_date_local': instance.launchDateLocal,
      'launch_site': instance.launchSite,
      'rocket': instance.rocket,
      'links': instance.links,
      'is_tentative': instance.isTentative,
      'launch_success': instance.launchSuccess,
      'launch_year': instance.launchYear,
      'mission_id': instance.missionIds,
    };
