// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'capsule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CapsuleModel _$CapsuleModelFromJson(Map<String, dynamic> json) {
  return _CapsuleModel.fromJson(json);
}

/// @nodoc
mixin _$CapsuleModel {
  String? get id => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'reuse_count')
  int? get reuseCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CapsuleModelCopyWith<CapsuleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CapsuleModelCopyWith<$Res> {
  factory $CapsuleModelCopyWith(
          CapsuleModel value, $Res Function(CapsuleModel) then) =
      _$CapsuleModelCopyWithImpl<$Res, CapsuleModel>;
  @useResult
  $Res call(
      {String? id,
      String? status,
      String? type,
      @JsonKey(name: 'reuse_count') int? reuseCount});
}

/// @nodoc
class _$CapsuleModelCopyWithImpl<$Res, $Val extends CapsuleModel>
    implements $CapsuleModelCopyWith<$Res> {
  _$CapsuleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? type = freezed,
    Object? reuseCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      reuseCount: freezed == reuseCount
          ? _value.reuseCount
          : reuseCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CapsuleModelImplCopyWith<$Res>
    implements $CapsuleModelCopyWith<$Res> {
  factory _$$CapsuleModelImplCopyWith(
          _$CapsuleModelImpl value, $Res Function(_$CapsuleModelImpl) then) =
      __$$CapsuleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? status,
      String? type,
      @JsonKey(name: 'reuse_count') int? reuseCount});
}

/// @nodoc
class __$$CapsuleModelImplCopyWithImpl<$Res>
    extends _$CapsuleModelCopyWithImpl<$Res, _$CapsuleModelImpl>
    implements _$$CapsuleModelImplCopyWith<$Res> {
  __$$CapsuleModelImplCopyWithImpl(
      _$CapsuleModelImpl _value, $Res Function(_$CapsuleModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? type = freezed,
    Object? reuseCount = freezed,
  }) {
    return _then(_$CapsuleModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      reuseCount: freezed == reuseCount
          ? _value.reuseCount
          : reuseCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CapsuleModelImpl extends _CapsuleModel {
  const _$CapsuleModelImpl(
      {this.id,
      this.status,
      this.type,
      @JsonKey(name: 'reuse_count') this.reuseCount})
      : super._();

  factory _$CapsuleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CapsuleModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? status;
  @override
  final String? type;
  @override
  @JsonKey(name: 'reuse_count')
  final int? reuseCount;

  @override
  String toString() {
    return 'CapsuleModel(id: $id, status: $status, type: $type, reuseCount: $reuseCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CapsuleModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.reuseCount, reuseCount) ||
                other.reuseCount == reuseCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, type, reuseCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CapsuleModelImplCopyWith<_$CapsuleModelImpl> get copyWith =>
      __$$CapsuleModelImplCopyWithImpl<_$CapsuleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CapsuleModelImplToJson(
      this,
    );
  }
}

abstract class _CapsuleModel extends CapsuleModel {
  const factory _CapsuleModel(
          {final String? id,
          final String? status,
          final String? type,
          @JsonKey(name: 'reuse_count') final int? reuseCount}) =
      _$CapsuleModelImpl;
  const _CapsuleModel._() : super._();

  factory _CapsuleModel.fromJson(Map<String, dynamic> json) =
      _$CapsuleModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get status;
  @override
  String? get type;
  @override
  @JsonKey(name: 'reuse_count')
  int? get reuseCount;
  @override
  @JsonKey(ignore: true)
  _$$CapsuleModelImplCopyWith<_$CapsuleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
