// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'launch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LaunchSiteModel _$LaunchSiteModelFromJson(Map<String, dynamic> json) {
  return _LaunchSiteModel.fromJson(json);
}

/// @nodoc
mixin _$LaunchSiteModel {
  @JsonKey(name: 'site_name_long')
  String? get siteNameLong => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LaunchSiteModelCopyWith<LaunchSiteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LaunchSiteModelCopyWith<$Res> {
  factory $LaunchSiteModelCopyWith(
          LaunchSiteModel value, $Res Function(LaunchSiteModel) then) =
      _$LaunchSiteModelCopyWithImpl<$Res, LaunchSiteModel>;
  @useResult
  $Res call({@JsonKey(name: 'site_name_long') String? siteNameLong});
}

/// @nodoc
class _$LaunchSiteModelCopyWithImpl<$Res, $Val extends LaunchSiteModel>
    implements $LaunchSiteModelCopyWith<$Res> {
  _$LaunchSiteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? siteNameLong = freezed,
  }) {
    return _then(_value.copyWith(
      siteNameLong: freezed == siteNameLong
          ? _value.siteNameLong
          : siteNameLong // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LaunchSiteModelImplCopyWith<$Res>
    implements $LaunchSiteModelCopyWith<$Res> {
  factory _$$LaunchSiteModelImplCopyWith(_$LaunchSiteModelImpl value,
          $Res Function(_$LaunchSiteModelImpl) then) =
      __$$LaunchSiteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'site_name_long') String? siteNameLong});
}

/// @nodoc
class __$$LaunchSiteModelImplCopyWithImpl<$Res>
    extends _$LaunchSiteModelCopyWithImpl<$Res, _$LaunchSiteModelImpl>
    implements _$$LaunchSiteModelImplCopyWith<$Res> {
  __$$LaunchSiteModelImplCopyWithImpl(
      _$LaunchSiteModelImpl _value, $Res Function(_$LaunchSiteModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? siteNameLong = freezed,
  }) {
    return _then(_$LaunchSiteModelImpl(
      siteNameLong: freezed == siteNameLong
          ? _value.siteNameLong
          : siteNameLong // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LaunchSiteModelImpl implements _LaunchSiteModel {
  const _$LaunchSiteModelImpl(
      {@JsonKey(name: 'site_name_long') this.siteNameLong});

  factory _$LaunchSiteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LaunchSiteModelImplFromJson(json);

  @override
  @JsonKey(name: 'site_name_long')
  final String? siteNameLong;

  @override
  String toString() {
    return 'LaunchSiteModel(siteNameLong: $siteNameLong)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LaunchSiteModelImpl &&
            (identical(other.siteNameLong, siteNameLong) ||
                other.siteNameLong == siteNameLong));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, siteNameLong);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LaunchSiteModelImplCopyWith<_$LaunchSiteModelImpl> get copyWith =>
      __$$LaunchSiteModelImplCopyWithImpl<_$LaunchSiteModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LaunchSiteModelImplToJson(
      this,
    );
  }
}

abstract class _LaunchSiteModel implements LaunchSiteModel {
  const factory _LaunchSiteModel(
          {@JsonKey(name: 'site_name_long') final String? siteNameLong}) =
      _$LaunchSiteModelImpl;

  factory _LaunchSiteModel.fromJson(Map<String, dynamic> json) =
      _$LaunchSiteModelImpl.fromJson;

  @override
  @JsonKey(name: 'site_name_long')
  String? get siteNameLong;
  @override
  @JsonKey(ignore: true)
  _$$LaunchSiteModelImplCopyWith<_$LaunchSiteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RocketBudgetModel _$RocketBudgetModelFromJson(Map<String, dynamic> json) {
  return _RocketBudgetModel.fromJson(json);
}

/// @nodoc
mixin _$RocketBudgetModel {
  @JsonKey(name: 'cost_per_launch')
  double? get cost => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RocketBudgetModelCopyWith<RocketBudgetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RocketBudgetModelCopyWith<$Res> {
  factory $RocketBudgetModelCopyWith(
          RocketBudgetModel value, $Res Function(RocketBudgetModel) then) =
      _$RocketBudgetModelCopyWithImpl<$Res, RocketBudgetModel>;
  @useResult
  $Res call({@JsonKey(name: 'cost_per_launch') double? cost});
}

/// @nodoc
class _$RocketBudgetModelCopyWithImpl<$Res, $Val extends RocketBudgetModel>
    implements $RocketBudgetModelCopyWith<$Res> {
  _$RocketBudgetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cost = freezed,
  }) {
    return _then(_value.copyWith(
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RocketBudgetModelImplCopyWith<$Res>
    implements $RocketBudgetModelCopyWith<$Res> {
  factory _$$RocketBudgetModelImplCopyWith(_$RocketBudgetModelImpl value,
          $Res Function(_$RocketBudgetModelImpl) then) =
      __$$RocketBudgetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'cost_per_launch') double? cost});
}

/// @nodoc
class __$$RocketBudgetModelImplCopyWithImpl<$Res>
    extends _$RocketBudgetModelCopyWithImpl<$Res, _$RocketBudgetModelImpl>
    implements _$$RocketBudgetModelImplCopyWith<$Res> {
  __$$RocketBudgetModelImplCopyWithImpl(_$RocketBudgetModelImpl _value,
      $Res Function(_$RocketBudgetModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cost = freezed,
  }) {
    return _then(_$RocketBudgetModelImpl(
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RocketBudgetModelImpl implements _RocketBudgetModel {
  const _$RocketBudgetModelImpl({@JsonKey(name: 'cost_per_launch') this.cost});

  factory _$RocketBudgetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RocketBudgetModelImplFromJson(json);

  @override
  @JsonKey(name: 'cost_per_launch')
  final double? cost;

  @override
  String toString() {
    return 'RocketBudgetModel(cost: $cost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RocketBudgetModelImpl &&
            (identical(other.cost, cost) || other.cost == cost));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cost);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RocketBudgetModelImplCopyWith<_$RocketBudgetModelImpl> get copyWith =>
      __$$RocketBudgetModelImplCopyWithImpl<_$RocketBudgetModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RocketBudgetModelImplToJson(
      this,
    );
  }
}

abstract class _RocketBudgetModel implements RocketBudgetModel {
  const factory _RocketBudgetModel(
          {@JsonKey(name: 'cost_per_launch') final double? cost}) =
      _$RocketBudgetModelImpl;

  factory _RocketBudgetModel.fromJson(Map<String, dynamic> json) =
      _$RocketBudgetModelImpl.fromJson;

  @override
  @JsonKey(name: 'cost_per_launch')
  double? get cost;
  @override
  @JsonKey(ignore: true)
  _$$RocketBudgetModelImplCopyWith<_$RocketBudgetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RocketModel _$RocketModelFromJson(Map<String, dynamic> json) {
  return _RocketModel.fromJson(json);
}

/// @nodoc
mixin _$RocketModel {
  @JsonKey(name: 'rocket_name')
  String? get rocketName => throw _privateConstructorUsedError;
  RocketBudgetModel? get rocket => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RocketModelCopyWith<RocketModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RocketModelCopyWith<$Res> {
  factory $RocketModelCopyWith(
          RocketModel value, $Res Function(RocketModel) then) =
      _$RocketModelCopyWithImpl<$Res, RocketModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'rocket_name') String? rocketName,
      RocketBudgetModel? rocket});

  $RocketBudgetModelCopyWith<$Res>? get rocket;
}

/// @nodoc
class _$RocketModelCopyWithImpl<$Res, $Val extends RocketModel>
    implements $RocketModelCopyWith<$Res> {
  _$RocketModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rocketName = freezed,
    Object? rocket = freezed,
  }) {
    return _then(_value.copyWith(
      rocketName: freezed == rocketName
          ? _value.rocketName
          : rocketName // ignore: cast_nullable_to_non_nullable
              as String?,
      rocket: freezed == rocket
          ? _value.rocket
          : rocket // ignore: cast_nullable_to_non_nullable
              as RocketBudgetModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RocketBudgetModelCopyWith<$Res>? get rocket {
    if (_value.rocket == null) {
      return null;
    }

    return $RocketBudgetModelCopyWith<$Res>(_value.rocket!, (value) {
      return _then(_value.copyWith(rocket: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RocketModelImplCopyWith<$Res>
    implements $RocketModelCopyWith<$Res> {
  factory _$$RocketModelImplCopyWith(
          _$RocketModelImpl value, $Res Function(_$RocketModelImpl) then) =
      __$$RocketModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'rocket_name') String? rocketName,
      RocketBudgetModel? rocket});

  @override
  $RocketBudgetModelCopyWith<$Res>? get rocket;
}

/// @nodoc
class __$$RocketModelImplCopyWithImpl<$Res>
    extends _$RocketModelCopyWithImpl<$Res, _$RocketModelImpl>
    implements _$$RocketModelImplCopyWith<$Res> {
  __$$RocketModelImplCopyWithImpl(
      _$RocketModelImpl _value, $Res Function(_$RocketModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rocketName = freezed,
    Object? rocket = freezed,
  }) {
    return _then(_$RocketModelImpl(
      rocketName: freezed == rocketName
          ? _value.rocketName
          : rocketName // ignore: cast_nullable_to_non_nullable
              as String?,
      rocket: freezed == rocket
          ? _value.rocket
          : rocket // ignore: cast_nullable_to_non_nullable
              as RocketBudgetModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RocketModelImpl implements _RocketModel {
  const _$RocketModelImpl(
      {@JsonKey(name: 'rocket_name') this.rocketName, this.rocket});

  factory _$RocketModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RocketModelImplFromJson(json);

  @override
  @JsonKey(name: 'rocket_name')
  final String? rocketName;
  @override
  final RocketBudgetModel? rocket;

  @override
  String toString() {
    return 'RocketModel(rocketName: $rocketName, rocket: $rocket)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RocketModelImpl &&
            (identical(other.rocketName, rocketName) ||
                other.rocketName == rocketName) &&
            (identical(other.rocket, rocket) || other.rocket == rocket));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rocketName, rocket);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RocketModelImplCopyWith<_$RocketModelImpl> get copyWith =>
      __$$RocketModelImplCopyWithImpl<_$RocketModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RocketModelImplToJson(
      this,
    );
  }
}

abstract class _RocketModel implements RocketModel {
  const factory _RocketModel(
      {@JsonKey(name: 'rocket_name') final String? rocketName,
      final RocketBudgetModel? rocket}) = _$RocketModelImpl;

  factory _RocketModel.fromJson(Map<String, dynamic> json) =
      _$RocketModelImpl.fromJson;

  @override
  @JsonKey(name: 'rocket_name')
  String? get rocketName;
  @override
  RocketBudgetModel? get rocket;
  @override
  @JsonKey(ignore: true)
  _$$RocketModelImplCopyWith<_$RocketModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LinksModel _$LinksModelFromJson(Map<String, dynamic> json) {
  return _LinksModel.fromJson(json);
}

/// @nodoc
mixin _$LinksModel {
  @JsonKey(name: 'mission_patch_small')
  String? get missionPatchSmall => throw _privateConstructorUsedError;
  @JsonKey(name: 'article_link')
  String? get articleLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'video_link')
  String? get videoLink => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinksModelCopyWith<LinksModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinksModelCopyWith<$Res> {
  factory $LinksModelCopyWith(
          LinksModel value, $Res Function(LinksModel) then) =
      _$LinksModelCopyWithImpl<$Res, LinksModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'mission_patch_small') String? missionPatchSmall,
      @JsonKey(name: 'article_link') String? articleLink,
      @JsonKey(name: 'video_link') String? videoLink});
}

/// @nodoc
class _$LinksModelCopyWithImpl<$Res, $Val extends LinksModel>
    implements $LinksModelCopyWith<$Res> {
  _$LinksModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? missionPatchSmall = freezed,
    Object? articleLink = freezed,
    Object? videoLink = freezed,
  }) {
    return _then(_value.copyWith(
      missionPatchSmall: freezed == missionPatchSmall
          ? _value.missionPatchSmall
          : missionPatchSmall // ignore: cast_nullable_to_non_nullable
              as String?,
      articleLink: freezed == articleLink
          ? _value.articleLink
          : articleLink // ignore: cast_nullable_to_non_nullable
              as String?,
      videoLink: freezed == videoLink
          ? _value.videoLink
          : videoLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LinksModelImplCopyWith<$Res>
    implements $LinksModelCopyWith<$Res> {
  factory _$$LinksModelImplCopyWith(
          _$LinksModelImpl value, $Res Function(_$LinksModelImpl) then) =
      __$$LinksModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'mission_patch_small') String? missionPatchSmall,
      @JsonKey(name: 'article_link') String? articleLink,
      @JsonKey(name: 'video_link') String? videoLink});
}

/// @nodoc
class __$$LinksModelImplCopyWithImpl<$Res>
    extends _$LinksModelCopyWithImpl<$Res, _$LinksModelImpl>
    implements _$$LinksModelImplCopyWith<$Res> {
  __$$LinksModelImplCopyWithImpl(
      _$LinksModelImpl _value, $Res Function(_$LinksModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? missionPatchSmall = freezed,
    Object? articleLink = freezed,
    Object? videoLink = freezed,
  }) {
    return _then(_$LinksModelImpl(
      missionPatchSmall: freezed == missionPatchSmall
          ? _value.missionPatchSmall
          : missionPatchSmall // ignore: cast_nullable_to_non_nullable
              as String?,
      articleLink: freezed == articleLink
          ? _value.articleLink
          : articleLink // ignore: cast_nullable_to_non_nullable
              as String?,
      videoLink: freezed == videoLink
          ? _value.videoLink
          : videoLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LinksModelImpl implements _LinksModel {
  const _$LinksModelImpl(
      {@JsonKey(name: 'mission_patch_small') this.missionPatchSmall,
      @JsonKey(name: 'article_link') this.articleLink,
      @JsonKey(name: 'video_link') this.videoLink});

  factory _$LinksModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinksModelImplFromJson(json);

  @override
  @JsonKey(name: 'mission_patch_small')
  final String? missionPatchSmall;
  @override
  @JsonKey(name: 'article_link')
  final String? articleLink;
  @override
  @JsonKey(name: 'video_link')
  final String? videoLink;

  @override
  String toString() {
    return 'LinksModel(missionPatchSmall: $missionPatchSmall, articleLink: $articleLink, videoLink: $videoLink)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinksModelImpl &&
            (identical(other.missionPatchSmall, missionPatchSmall) ||
                other.missionPatchSmall == missionPatchSmall) &&
            (identical(other.articleLink, articleLink) ||
                other.articleLink == articleLink) &&
            (identical(other.videoLink, videoLink) ||
                other.videoLink == videoLink));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, missionPatchSmall, articleLink, videoLink);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LinksModelImplCopyWith<_$LinksModelImpl> get copyWith =>
      __$$LinksModelImplCopyWithImpl<_$LinksModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LinksModelImplToJson(
      this,
    );
  }
}

abstract class _LinksModel implements LinksModel {
  const factory _LinksModel(
      {@JsonKey(name: 'mission_patch_small') final String? missionPatchSmall,
      @JsonKey(name: 'article_link') final String? articleLink,
      @JsonKey(name: 'video_link') final String? videoLink}) = _$LinksModelImpl;

  factory _LinksModel.fromJson(Map<String, dynamic> json) =
      _$LinksModelImpl.fromJson;

  @override
  @JsonKey(name: 'mission_patch_small')
  String? get missionPatchSmall;
  @override
  @JsonKey(name: 'article_link')
  String? get articleLink;
  @override
  @JsonKey(name: 'video_link')
  String? get videoLink;
  @override
  @JsonKey(ignore: true)
  _$$LinksModelImplCopyWith<_$LinksModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LaunchModel _$LaunchModelFromJson(Map<String, dynamic> json) {
  return _LaunchModel.fromJson(json);
}

/// @nodoc
mixin _$LaunchModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'mission_name')
  String? get missionName => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;
  @JsonKey(name: 'launch_date_utc')
  String? get launchDateUtc => throw _privateConstructorUsedError;
  @JsonKey(name: 'launch_date_local')
  String? get launchDateLocal => throw _privateConstructorUsedError;
  @JsonKey(name: 'launch_site')
  LaunchSiteModel? get launchSite => throw _privateConstructorUsedError;
  RocketModel? get rocket => throw _privateConstructorUsedError;
  LinksModel? get links => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_tentative')
  bool? get isTentative => throw _privateConstructorUsedError;
  @JsonKey(name: 'launch_success')
  bool? get launchSuccess => throw _privateConstructorUsedError;
  @JsonKey(name: 'launch_year')
  String? get launchYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'mission_id')
  List<String>? get missionIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LaunchModelCopyWith<LaunchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LaunchModelCopyWith<$Res> {
  factory $LaunchModelCopyWith(
          LaunchModel value, $Res Function(LaunchModel) then) =
      _$LaunchModelCopyWithImpl<$Res, LaunchModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'mission_name') String? missionName,
      String? details,
      @JsonKey(name: 'launch_date_utc') String? launchDateUtc,
      @JsonKey(name: 'launch_date_local') String? launchDateLocal,
      @JsonKey(name: 'launch_site') LaunchSiteModel? launchSite,
      RocketModel? rocket,
      LinksModel? links,
      @JsonKey(name: 'is_tentative') bool? isTentative,
      @JsonKey(name: 'launch_success') bool? launchSuccess,
      @JsonKey(name: 'launch_year') String? launchYear,
      @JsonKey(name: 'mission_id') List<String>? missionIds});

  $LaunchSiteModelCopyWith<$Res>? get launchSite;
  $RocketModelCopyWith<$Res>? get rocket;
  $LinksModelCopyWith<$Res>? get links;
}

/// @nodoc
class _$LaunchModelCopyWithImpl<$Res, $Val extends LaunchModel>
    implements $LaunchModelCopyWith<$Res> {
  _$LaunchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? missionName = freezed,
    Object? details = freezed,
    Object? launchDateUtc = freezed,
    Object? launchDateLocal = freezed,
    Object? launchSite = freezed,
    Object? rocket = freezed,
    Object? links = freezed,
    Object? isTentative = freezed,
    Object? launchSuccess = freezed,
    Object? launchYear = freezed,
    Object? missionIds = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      missionName: freezed == missionName
          ? _value.missionName
          : missionName // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      launchDateUtc: freezed == launchDateUtc
          ? _value.launchDateUtc
          : launchDateUtc // ignore: cast_nullable_to_non_nullable
              as String?,
      launchDateLocal: freezed == launchDateLocal
          ? _value.launchDateLocal
          : launchDateLocal // ignore: cast_nullable_to_non_nullable
              as String?,
      launchSite: freezed == launchSite
          ? _value.launchSite
          : launchSite // ignore: cast_nullable_to_non_nullable
              as LaunchSiteModel?,
      rocket: freezed == rocket
          ? _value.rocket
          : rocket // ignore: cast_nullable_to_non_nullable
              as RocketModel?,
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as LinksModel?,
      isTentative: freezed == isTentative
          ? _value.isTentative
          : isTentative // ignore: cast_nullable_to_non_nullable
              as bool?,
      launchSuccess: freezed == launchSuccess
          ? _value.launchSuccess
          : launchSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      launchYear: freezed == launchYear
          ? _value.launchYear
          : launchYear // ignore: cast_nullable_to_non_nullable
              as String?,
      missionIds: freezed == missionIds
          ? _value.missionIds
          : missionIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LaunchSiteModelCopyWith<$Res>? get launchSite {
    if (_value.launchSite == null) {
      return null;
    }

    return $LaunchSiteModelCopyWith<$Res>(_value.launchSite!, (value) {
      return _then(_value.copyWith(launchSite: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RocketModelCopyWith<$Res>? get rocket {
    if (_value.rocket == null) {
      return null;
    }

    return $RocketModelCopyWith<$Res>(_value.rocket!, (value) {
      return _then(_value.copyWith(rocket: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LinksModelCopyWith<$Res>? get links {
    if (_value.links == null) {
      return null;
    }

    return $LinksModelCopyWith<$Res>(_value.links!, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LaunchModelImplCopyWith<$Res>
    implements $LaunchModelCopyWith<$Res> {
  factory _$$LaunchModelImplCopyWith(
          _$LaunchModelImpl value, $Res Function(_$LaunchModelImpl) then) =
      __$$LaunchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'mission_name') String? missionName,
      String? details,
      @JsonKey(name: 'launch_date_utc') String? launchDateUtc,
      @JsonKey(name: 'launch_date_local') String? launchDateLocal,
      @JsonKey(name: 'launch_site') LaunchSiteModel? launchSite,
      RocketModel? rocket,
      LinksModel? links,
      @JsonKey(name: 'is_tentative') bool? isTentative,
      @JsonKey(name: 'launch_success') bool? launchSuccess,
      @JsonKey(name: 'launch_year') String? launchYear,
      @JsonKey(name: 'mission_id') List<String>? missionIds});

  @override
  $LaunchSiteModelCopyWith<$Res>? get launchSite;
  @override
  $RocketModelCopyWith<$Res>? get rocket;
  @override
  $LinksModelCopyWith<$Res>? get links;
}

/// @nodoc
class __$$LaunchModelImplCopyWithImpl<$Res>
    extends _$LaunchModelCopyWithImpl<$Res, _$LaunchModelImpl>
    implements _$$LaunchModelImplCopyWith<$Res> {
  __$$LaunchModelImplCopyWithImpl(
      _$LaunchModelImpl _value, $Res Function(_$LaunchModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? missionName = freezed,
    Object? details = freezed,
    Object? launchDateUtc = freezed,
    Object? launchDateLocal = freezed,
    Object? launchSite = freezed,
    Object? rocket = freezed,
    Object? links = freezed,
    Object? isTentative = freezed,
    Object? launchSuccess = freezed,
    Object? launchYear = freezed,
    Object? missionIds = freezed,
  }) {
    return _then(_$LaunchModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      missionName: freezed == missionName
          ? _value.missionName
          : missionName // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      launchDateUtc: freezed == launchDateUtc
          ? _value.launchDateUtc
          : launchDateUtc // ignore: cast_nullable_to_non_nullable
              as String?,
      launchDateLocal: freezed == launchDateLocal
          ? _value.launchDateLocal
          : launchDateLocal // ignore: cast_nullable_to_non_nullable
              as String?,
      launchSite: freezed == launchSite
          ? _value.launchSite
          : launchSite // ignore: cast_nullable_to_non_nullable
              as LaunchSiteModel?,
      rocket: freezed == rocket
          ? _value.rocket
          : rocket // ignore: cast_nullable_to_non_nullable
              as RocketModel?,
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as LinksModel?,
      isTentative: freezed == isTentative
          ? _value.isTentative
          : isTentative // ignore: cast_nullable_to_non_nullable
              as bool?,
      launchSuccess: freezed == launchSuccess
          ? _value.launchSuccess
          : launchSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      launchYear: freezed == launchYear
          ? _value.launchYear
          : launchYear // ignore: cast_nullable_to_non_nullable
              as String?,
      missionIds: freezed == missionIds
          ? _value._missionIds
          : missionIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LaunchModelImpl extends _LaunchModel {
  const _$LaunchModelImpl(
      {required this.id,
      @JsonKey(name: 'mission_name') this.missionName,
      this.details,
      @JsonKey(name: 'launch_date_utc') this.launchDateUtc,
      @JsonKey(name: 'launch_date_local') this.launchDateLocal,
      @JsonKey(name: 'launch_site') this.launchSite,
      this.rocket,
      this.links,
      @JsonKey(name: 'is_tentative') this.isTentative,
      @JsonKey(name: 'launch_success') this.launchSuccess,
      @JsonKey(name: 'launch_year') this.launchYear,
      @JsonKey(name: 'mission_id') final List<String>? missionIds = const []})
      : _missionIds = missionIds,
        super._();

  factory _$LaunchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LaunchModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'mission_name')
  final String? missionName;
  @override
  final String? details;
  @override
  @JsonKey(name: 'launch_date_utc')
  final String? launchDateUtc;
  @override
  @JsonKey(name: 'launch_date_local')
  final String? launchDateLocal;
  @override
  @JsonKey(name: 'launch_site')
  final LaunchSiteModel? launchSite;
  @override
  final RocketModel? rocket;
  @override
  final LinksModel? links;
  @override
  @JsonKey(name: 'is_tentative')
  final bool? isTentative;
  @override
  @JsonKey(name: 'launch_success')
  final bool? launchSuccess;
  @override
  @JsonKey(name: 'launch_year')
  final String? launchYear;
  final List<String>? _missionIds;
  @override
  @JsonKey(name: 'mission_id')
  List<String>? get missionIds {
    final value = _missionIds;
    if (value == null) return null;
    if (_missionIds is EqualUnmodifiableListView) return _missionIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LaunchModel(id: $id, missionName: $missionName, details: $details, launchDateUtc: $launchDateUtc, launchDateLocal: $launchDateLocal, launchSite: $launchSite, rocket: $rocket, links: $links, isTentative: $isTentative, launchSuccess: $launchSuccess, launchYear: $launchYear, missionIds: $missionIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LaunchModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.missionName, missionName) ||
                other.missionName == missionName) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.launchDateUtc, launchDateUtc) ||
                other.launchDateUtc == launchDateUtc) &&
            (identical(other.launchDateLocal, launchDateLocal) ||
                other.launchDateLocal == launchDateLocal) &&
            (identical(other.launchSite, launchSite) ||
                other.launchSite == launchSite) &&
            (identical(other.rocket, rocket) || other.rocket == rocket) &&
            (identical(other.links, links) || other.links == links) &&
            (identical(other.isTentative, isTentative) ||
                other.isTentative == isTentative) &&
            (identical(other.launchSuccess, launchSuccess) ||
                other.launchSuccess == launchSuccess) &&
            (identical(other.launchYear, launchYear) ||
                other.launchYear == launchYear) &&
            const DeepCollectionEquality()
                .equals(other._missionIds, _missionIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      missionName,
      details,
      launchDateUtc,
      launchDateLocal,
      launchSite,
      rocket,
      links,
      isTentative,
      launchSuccess,
      launchYear,
      const DeepCollectionEquality().hash(_missionIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LaunchModelImplCopyWith<_$LaunchModelImpl> get copyWith =>
      __$$LaunchModelImplCopyWithImpl<_$LaunchModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LaunchModelImplToJson(
      this,
    );
  }
}

abstract class _LaunchModel extends LaunchModel {
  const factory _LaunchModel(
          {required final String id,
          @JsonKey(name: 'mission_name') final String? missionName,
          final String? details,
          @JsonKey(name: 'launch_date_utc') final String? launchDateUtc,
          @JsonKey(name: 'launch_date_local') final String? launchDateLocal,
          @JsonKey(name: 'launch_site') final LaunchSiteModel? launchSite,
          final RocketModel? rocket,
          final LinksModel? links,
          @JsonKey(name: 'is_tentative') final bool? isTentative,
          @JsonKey(name: 'launch_success') final bool? launchSuccess,
          @JsonKey(name: 'launch_year') final String? launchYear,
          @JsonKey(name: 'mission_id') final List<String>? missionIds}) =
      _$LaunchModelImpl;
  const _LaunchModel._() : super._();

  factory _LaunchModel.fromJson(Map<String, dynamic> json) =
      _$LaunchModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'mission_name')
  String? get missionName;
  @override
  String? get details;
  @override
  @JsonKey(name: 'launch_date_utc')
  String? get launchDateUtc;
  @override
  @JsonKey(name: 'launch_date_local')
  String? get launchDateLocal;
  @override
  @JsonKey(name: 'launch_site')
  LaunchSiteModel? get launchSite;
  @override
  RocketModel? get rocket;
  @override
  LinksModel? get links;
  @override
  @JsonKey(name: 'is_tentative')
  bool? get isTentative;
  @override
  @JsonKey(name: 'launch_success')
  bool? get launchSuccess;
  @override
  @JsonKey(name: 'launch_year')
  String? get launchYear;
  @override
  @JsonKey(name: 'mission_id')
  List<String>? get missionIds;
  @override
  @JsonKey(ignore: true)
  _$$LaunchModelImplCopyWith<_$LaunchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
