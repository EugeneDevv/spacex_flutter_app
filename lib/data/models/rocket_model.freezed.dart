// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rocket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DimensionModel _$DimensionModelFromJson(Map<String, dynamic> json) {
  return _DimensionModel.fromJson(json);
}

/// @nodoc
mixin _$DimensionModel {
  double? get meters => throw _privateConstructorUsedError;
  double? get feet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DimensionModelCopyWith<DimensionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DimensionModelCopyWith<$Res> {
  factory $DimensionModelCopyWith(
          DimensionModel value, $Res Function(DimensionModel) then) =
      _$DimensionModelCopyWithImpl<$Res, DimensionModel>;
  @useResult
  $Res call({double? meters, double? feet});
}

/// @nodoc
class _$DimensionModelCopyWithImpl<$Res, $Val extends DimensionModel>
    implements $DimensionModelCopyWith<$Res> {
  _$DimensionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meters = freezed,
    Object? feet = freezed,
  }) {
    return _then(_value.copyWith(
      meters: freezed == meters
          ? _value.meters
          : meters // ignore: cast_nullable_to_non_nullable
              as double?,
      feet: freezed == feet
          ? _value.feet
          : feet // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DimensionModelImplCopyWith<$Res>
    implements $DimensionModelCopyWith<$Res> {
  factory _$$DimensionModelImplCopyWith(_$DimensionModelImpl value,
          $Res Function(_$DimensionModelImpl) then) =
      __$$DimensionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? meters, double? feet});
}

/// @nodoc
class __$$DimensionModelImplCopyWithImpl<$Res>
    extends _$DimensionModelCopyWithImpl<$Res, _$DimensionModelImpl>
    implements _$$DimensionModelImplCopyWith<$Res> {
  __$$DimensionModelImplCopyWithImpl(
      _$DimensionModelImpl _value, $Res Function(_$DimensionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meters = freezed,
    Object? feet = freezed,
  }) {
    return _then(_$DimensionModelImpl(
      meters: freezed == meters
          ? _value.meters
          : meters // ignore: cast_nullable_to_non_nullable
              as double?,
      feet: freezed == feet
          ? _value.feet
          : feet // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DimensionModelImpl implements _DimensionModel {
  const _$DimensionModelImpl({this.meters, this.feet});

  factory _$DimensionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DimensionModelImplFromJson(json);

  @override
  final double? meters;
  @override
  final double? feet;

  @override
  String toString() {
    return 'DimensionModel(meters: $meters, feet: $feet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DimensionModelImpl &&
            (identical(other.meters, meters) || other.meters == meters) &&
            (identical(other.feet, feet) || other.feet == feet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, meters, feet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DimensionModelImplCopyWith<_$DimensionModelImpl> get copyWith =>
      __$$DimensionModelImplCopyWithImpl<_$DimensionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DimensionModelImplToJson(
      this,
    );
  }
}

abstract class _DimensionModel implements DimensionModel {
  const factory _DimensionModel({final double? meters, final double? feet}) =
      _$DimensionModelImpl;

  factory _DimensionModel.fromJson(Map<String, dynamic> json) =
      _$DimensionModelImpl.fromJson;

  @override
  double? get meters;
  @override
  double? get feet;
  @override
  @JsonKey(ignore: true)
  _$$DimensionModelImplCopyWith<_$DimensionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MassModel _$MassModelFromJson(Map<String, dynamic> json) {
  return _MassModel.fromJson(json);
}

/// @nodoc
mixin _$MassModel {
  int? get kg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MassModelCopyWith<MassModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MassModelCopyWith<$Res> {
  factory $MassModelCopyWith(MassModel value, $Res Function(MassModel) then) =
      _$MassModelCopyWithImpl<$Res, MassModel>;
  @useResult
  $Res call({int? kg});
}

/// @nodoc
class _$MassModelCopyWithImpl<$Res, $Val extends MassModel>
    implements $MassModelCopyWith<$Res> {
  _$MassModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kg = freezed,
  }) {
    return _then(_value.copyWith(
      kg: freezed == kg
          ? _value.kg
          : kg // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MassModelImplCopyWith<$Res>
    implements $MassModelCopyWith<$Res> {
  factory _$$MassModelImplCopyWith(
          _$MassModelImpl value, $Res Function(_$MassModelImpl) then) =
      __$$MassModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? kg});
}

/// @nodoc
class __$$MassModelImplCopyWithImpl<$Res>
    extends _$MassModelCopyWithImpl<$Res, _$MassModelImpl>
    implements _$$MassModelImplCopyWith<$Res> {
  __$$MassModelImplCopyWithImpl(
      _$MassModelImpl _value, $Res Function(_$MassModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kg = freezed,
  }) {
    return _then(_$MassModelImpl(
      kg: freezed == kg
          ? _value.kg
          : kg // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MassModelImpl implements _MassModel {
  const _$MassModelImpl({this.kg});

  factory _$MassModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MassModelImplFromJson(json);

  @override
  final int? kg;

  @override
  String toString() {
    return 'MassModel(kg: $kg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MassModelImpl &&
            (identical(other.kg, kg) || other.kg == kg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, kg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MassModelImplCopyWith<_$MassModelImpl> get copyWith =>
      __$$MassModelImplCopyWithImpl<_$MassModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MassModelImplToJson(
      this,
    );
  }
}

abstract class _MassModel implements MassModel {
  const factory _MassModel({final int? kg}) = _$MassModelImpl;

  factory _MassModel.fromJson(Map<String, dynamic> json) =
      _$MassModelImpl.fromJson;

  @override
  int? get kg;
  @override
  @JsonKey(ignore: true)
  _$$MassModelImplCopyWith<_$MassModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LandingLegsModel _$LandingLegsModelFromJson(Map<String, dynamic> json) {
  return _LandingLegsModel.fromJson(json);
}

/// @nodoc
mixin _$LandingLegsModel {
  int? get number => throw _privateConstructorUsedError;
  String? get material => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LandingLegsModelCopyWith<LandingLegsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LandingLegsModelCopyWith<$Res> {
  factory $LandingLegsModelCopyWith(
          LandingLegsModel value, $Res Function(LandingLegsModel) then) =
      _$LandingLegsModelCopyWithImpl<$Res, LandingLegsModel>;
  @useResult
  $Res call({int? number, String? material});
}

/// @nodoc
class _$LandingLegsModelCopyWithImpl<$Res, $Val extends LandingLegsModel>
    implements $LandingLegsModelCopyWith<$Res> {
  _$LandingLegsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? material = freezed,
  }) {
    return _then(_value.copyWith(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      material: freezed == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LandingLegsModelImplCopyWith<$Res>
    implements $LandingLegsModelCopyWith<$Res> {
  factory _$$LandingLegsModelImplCopyWith(_$LandingLegsModelImpl value,
          $Res Function(_$LandingLegsModelImpl) then) =
      __$$LandingLegsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? number, String? material});
}

/// @nodoc
class __$$LandingLegsModelImplCopyWithImpl<$Res>
    extends _$LandingLegsModelCopyWithImpl<$Res, _$LandingLegsModelImpl>
    implements _$$LandingLegsModelImplCopyWith<$Res> {
  __$$LandingLegsModelImplCopyWithImpl(_$LandingLegsModelImpl _value,
      $Res Function(_$LandingLegsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? material = freezed,
  }) {
    return _then(_$LandingLegsModelImpl(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      material: freezed == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LandingLegsModelImpl implements _LandingLegsModel {
  const _$LandingLegsModelImpl({this.number, this.material});

  factory _$LandingLegsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LandingLegsModelImplFromJson(json);

  @override
  final int? number;
  @override
  final String? material;

  @override
  String toString() {
    return 'LandingLegsModel(number: $number, material: $material)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LandingLegsModelImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.material, material) ||
                other.material == material));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, number, material);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LandingLegsModelImplCopyWith<_$LandingLegsModelImpl> get copyWith =>
      __$$LandingLegsModelImplCopyWithImpl<_$LandingLegsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LandingLegsModelImplToJson(
      this,
    );
  }
}

abstract class _LandingLegsModel implements LandingLegsModel {
  const factory _LandingLegsModel({final int? number, final String? material}) =
      _$LandingLegsModelImpl;

  factory _LandingLegsModel.fromJson(Map<String, dynamic> json) =
      _$LandingLegsModelImpl.fromJson;

  @override
  int? get number;
  @override
  String? get material;
  @override
  @JsonKey(ignore: true)
  _$$LandingLegsModelImplCopyWith<_$LandingLegsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ThrustModel _$ThrustModelFromJson(Map<String, dynamic> json) {
  return _ThrustModel.fromJson(json);
}

/// @nodoc
mixin _$ThrustModel {
  int? get kN => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThrustModelCopyWith<ThrustModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThrustModelCopyWith<$Res> {
  factory $ThrustModelCopyWith(
          ThrustModel value, $Res Function(ThrustModel) then) =
      _$ThrustModelCopyWithImpl<$Res, ThrustModel>;
  @useResult
  $Res call({int? kN});
}

/// @nodoc
class _$ThrustModelCopyWithImpl<$Res, $Val extends ThrustModel>
    implements $ThrustModelCopyWith<$Res> {
  _$ThrustModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kN = freezed,
  }) {
    return _then(_value.copyWith(
      kN: freezed == kN
          ? _value.kN
          : kN // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThrustModelImplCopyWith<$Res>
    implements $ThrustModelCopyWith<$Res> {
  factory _$$ThrustModelImplCopyWith(
          _$ThrustModelImpl value, $Res Function(_$ThrustModelImpl) then) =
      __$$ThrustModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? kN});
}

/// @nodoc
class __$$ThrustModelImplCopyWithImpl<$Res>
    extends _$ThrustModelCopyWithImpl<$Res, _$ThrustModelImpl>
    implements _$$ThrustModelImplCopyWith<$Res> {
  __$$ThrustModelImplCopyWithImpl(
      _$ThrustModelImpl _value, $Res Function(_$ThrustModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kN = freezed,
  }) {
    return _then(_$ThrustModelImpl(
      kN: freezed == kN
          ? _value.kN
          : kN // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThrustModelImpl implements _ThrustModel {
  const _$ThrustModelImpl({this.kN});

  factory _$ThrustModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThrustModelImplFromJson(json);

  @override
  final int? kN;

  @override
  String toString() {
    return 'ThrustModel(kN: $kN)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThrustModelImpl &&
            (identical(other.kN, kN) || other.kN == kN));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, kN);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThrustModelImplCopyWith<_$ThrustModelImpl> get copyWith =>
      __$$ThrustModelImplCopyWithImpl<_$ThrustModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThrustModelImplToJson(
      this,
    );
  }
}

abstract class _ThrustModel implements ThrustModel {
  const factory _ThrustModel({final int? kN}) = _$ThrustModelImpl;

  factory _ThrustModel.fromJson(Map<String, dynamic> json) =
      _$ThrustModelImpl.fromJson;

  @override
  int? get kN;
  @override
  @JsonKey(ignore: true)
  _$$ThrustModelImplCopyWith<_$ThrustModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EnginesModel _$EnginesModelFromJson(Map<String, dynamic> json) {
  return _EnginesModel.fromJson(json);
}

/// @nodoc
mixin _$EnginesModel {
  int? get number => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get version => throw _privateConstructorUsedError;
  String? get layout =>
      throw _privateConstructorUsedError; // JSON provides a string "2", so we use String here.
  @JsonKey(name: 'engine_loss_max')
  String? get engineLossMax => throw _privateConstructorUsedError;
  @JsonKey(name: 'propellant_1')
  String? get propellant1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'propellant_2')
  String? get propellant2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'thrust_sea_level')
  ThrustModel? get thrustSeaLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'thrust_vacuum')
  ThrustModel? get thrustVacuum => throw _privateConstructorUsedError;
  @JsonKey(name: 'thrust_to_weight')
  double? get thrustToWeight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnginesModelCopyWith<EnginesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnginesModelCopyWith<$Res> {
  factory $EnginesModelCopyWith(
          EnginesModel value, $Res Function(EnginesModel) then) =
      _$EnginesModelCopyWithImpl<$Res, EnginesModel>;
  @useResult
  $Res call(
      {int? number,
      String? type,
      String? version,
      String? layout,
      @JsonKey(name: 'engine_loss_max') String? engineLossMax,
      @JsonKey(name: 'propellant_1') String? propellant1,
      @JsonKey(name: 'propellant_2') String? propellant2,
      @JsonKey(name: 'thrust_sea_level') ThrustModel? thrustSeaLevel,
      @JsonKey(name: 'thrust_vacuum') ThrustModel? thrustVacuum,
      @JsonKey(name: 'thrust_to_weight') double? thrustToWeight});

  $ThrustModelCopyWith<$Res>? get thrustSeaLevel;
  $ThrustModelCopyWith<$Res>? get thrustVacuum;
}

/// @nodoc
class _$EnginesModelCopyWithImpl<$Res, $Val extends EnginesModel>
    implements $EnginesModelCopyWith<$Res> {
  _$EnginesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? type = freezed,
    Object? version = freezed,
    Object? layout = freezed,
    Object? engineLossMax = freezed,
    Object? propellant1 = freezed,
    Object? propellant2 = freezed,
    Object? thrustSeaLevel = freezed,
    Object? thrustVacuum = freezed,
    Object? thrustToWeight = freezed,
  }) {
    return _then(_value.copyWith(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      layout: freezed == layout
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as String?,
      engineLossMax: freezed == engineLossMax
          ? _value.engineLossMax
          : engineLossMax // ignore: cast_nullable_to_non_nullable
              as String?,
      propellant1: freezed == propellant1
          ? _value.propellant1
          : propellant1 // ignore: cast_nullable_to_non_nullable
              as String?,
      propellant2: freezed == propellant2
          ? _value.propellant2
          : propellant2 // ignore: cast_nullable_to_non_nullable
              as String?,
      thrustSeaLevel: freezed == thrustSeaLevel
          ? _value.thrustSeaLevel
          : thrustSeaLevel // ignore: cast_nullable_to_non_nullable
              as ThrustModel?,
      thrustVacuum: freezed == thrustVacuum
          ? _value.thrustVacuum
          : thrustVacuum // ignore: cast_nullable_to_non_nullable
              as ThrustModel?,
      thrustToWeight: freezed == thrustToWeight
          ? _value.thrustToWeight
          : thrustToWeight // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ThrustModelCopyWith<$Res>? get thrustSeaLevel {
    if (_value.thrustSeaLevel == null) {
      return null;
    }

    return $ThrustModelCopyWith<$Res>(_value.thrustSeaLevel!, (value) {
      return _then(_value.copyWith(thrustSeaLevel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ThrustModelCopyWith<$Res>? get thrustVacuum {
    if (_value.thrustVacuum == null) {
      return null;
    }

    return $ThrustModelCopyWith<$Res>(_value.thrustVacuum!, (value) {
      return _then(_value.copyWith(thrustVacuum: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EnginesModelImplCopyWith<$Res>
    implements $EnginesModelCopyWith<$Res> {
  factory _$$EnginesModelImplCopyWith(
          _$EnginesModelImpl value, $Res Function(_$EnginesModelImpl) then) =
      __$$EnginesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? number,
      String? type,
      String? version,
      String? layout,
      @JsonKey(name: 'engine_loss_max') String? engineLossMax,
      @JsonKey(name: 'propellant_1') String? propellant1,
      @JsonKey(name: 'propellant_2') String? propellant2,
      @JsonKey(name: 'thrust_sea_level') ThrustModel? thrustSeaLevel,
      @JsonKey(name: 'thrust_vacuum') ThrustModel? thrustVacuum,
      @JsonKey(name: 'thrust_to_weight') double? thrustToWeight});

  @override
  $ThrustModelCopyWith<$Res>? get thrustSeaLevel;
  @override
  $ThrustModelCopyWith<$Res>? get thrustVacuum;
}

/// @nodoc
class __$$EnginesModelImplCopyWithImpl<$Res>
    extends _$EnginesModelCopyWithImpl<$Res, _$EnginesModelImpl>
    implements _$$EnginesModelImplCopyWith<$Res> {
  __$$EnginesModelImplCopyWithImpl(
      _$EnginesModelImpl _value, $Res Function(_$EnginesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? type = freezed,
    Object? version = freezed,
    Object? layout = freezed,
    Object? engineLossMax = freezed,
    Object? propellant1 = freezed,
    Object? propellant2 = freezed,
    Object? thrustSeaLevel = freezed,
    Object? thrustVacuum = freezed,
    Object? thrustToWeight = freezed,
  }) {
    return _then(_$EnginesModelImpl(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      layout: freezed == layout
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as String?,
      engineLossMax: freezed == engineLossMax
          ? _value.engineLossMax
          : engineLossMax // ignore: cast_nullable_to_non_nullable
              as String?,
      propellant1: freezed == propellant1
          ? _value.propellant1
          : propellant1 // ignore: cast_nullable_to_non_nullable
              as String?,
      propellant2: freezed == propellant2
          ? _value.propellant2
          : propellant2 // ignore: cast_nullable_to_non_nullable
              as String?,
      thrustSeaLevel: freezed == thrustSeaLevel
          ? _value.thrustSeaLevel
          : thrustSeaLevel // ignore: cast_nullable_to_non_nullable
              as ThrustModel?,
      thrustVacuum: freezed == thrustVacuum
          ? _value.thrustVacuum
          : thrustVacuum // ignore: cast_nullable_to_non_nullable
              as ThrustModel?,
      thrustToWeight: freezed == thrustToWeight
          ? _value.thrustToWeight
          : thrustToWeight // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnginesModelImpl implements _EnginesModel {
  const _$EnginesModelImpl(
      {this.number,
      this.type,
      this.version,
      this.layout,
      @JsonKey(name: 'engine_loss_max') this.engineLossMax,
      @JsonKey(name: 'propellant_1') this.propellant1,
      @JsonKey(name: 'propellant_2') this.propellant2,
      @JsonKey(name: 'thrust_sea_level') this.thrustSeaLevel,
      @JsonKey(name: 'thrust_vacuum') this.thrustVacuum,
      @JsonKey(name: 'thrust_to_weight') this.thrustToWeight});

  factory _$EnginesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnginesModelImplFromJson(json);

  @override
  final int? number;
  @override
  final String? type;
  @override
  final String? version;
  @override
  final String? layout;
// JSON provides a string "2", so we use String here.
  @override
  @JsonKey(name: 'engine_loss_max')
  final String? engineLossMax;
  @override
  @JsonKey(name: 'propellant_1')
  final String? propellant1;
  @override
  @JsonKey(name: 'propellant_2')
  final String? propellant2;
  @override
  @JsonKey(name: 'thrust_sea_level')
  final ThrustModel? thrustSeaLevel;
  @override
  @JsonKey(name: 'thrust_vacuum')
  final ThrustModel? thrustVacuum;
  @override
  @JsonKey(name: 'thrust_to_weight')
  final double? thrustToWeight;

  @override
  String toString() {
    return 'EnginesModel(number: $number, type: $type, version: $version, layout: $layout, engineLossMax: $engineLossMax, propellant1: $propellant1, propellant2: $propellant2, thrustSeaLevel: $thrustSeaLevel, thrustVacuum: $thrustVacuum, thrustToWeight: $thrustToWeight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnginesModelImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.layout, layout) || other.layout == layout) &&
            (identical(other.engineLossMax, engineLossMax) ||
                other.engineLossMax == engineLossMax) &&
            (identical(other.propellant1, propellant1) ||
                other.propellant1 == propellant1) &&
            (identical(other.propellant2, propellant2) ||
                other.propellant2 == propellant2) &&
            (identical(other.thrustSeaLevel, thrustSeaLevel) ||
                other.thrustSeaLevel == thrustSeaLevel) &&
            (identical(other.thrustVacuum, thrustVacuum) ||
                other.thrustVacuum == thrustVacuum) &&
            (identical(other.thrustToWeight, thrustToWeight) ||
                other.thrustToWeight == thrustToWeight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      number,
      type,
      version,
      layout,
      engineLossMax,
      propellant1,
      propellant2,
      thrustSeaLevel,
      thrustVacuum,
      thrustToWeight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnginesModelImplCopyWith<_$EnginesModelImpl> get copyWith =>
      __$$EnginesModelImplCopyWithImpl<_$EnginesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnginesModelImplToJson(
      this,
    );
  }
}

abstract class _EnginesModel implements EnginesModel {
  const factory _EnginesModel(
          {final int? number,
          final String? type,
          final String? version,
          final String? layout,
          @JsonKey(name: 'engine_loss_max') final String? engineLossMax,
          @JsonKey(name: 'propellant_1') final String? propellant1,
          @JsonKey(name: 'propellant_2') final String? propellant2,
          @JsonKey(name: 'thrust_sea_level') final ThrustModel? thrustSeaLevel,
          @JsonKey(name: 'thrust_vacuum') final ThrustModel? thrustVacuum,
          @JsonKey(name: 'thrust_to_weight') final double? thrustToWeight}) =
      _$EnginesModelImpl;

  factory _EnginesModel.fromJson(Map<String, dynamic> json) =
      _$EnginesModelImpl.fromJson;

  @override
  int? get number;
  @override
  String? get type;
  @override
  String? get version;
  @override
  String? get layout;
  @override // JSON provides a string "2", so we use String here.
  @JsonKey(name: 'engine_loss_max')
  String? get engineLossMax;
  @override
  @JsonKey(name: 'propellant_1')
  String? get propellant1;
  @override
  @JsonKey(name: 'propellant_2')
  String? get propellant2;
  @override
  @JsonKey(name: 'thrust_sea_level')
  ThrustModel? get thrustSeaLevel;
  @override
  @JsonKey(name: 'thrust_vacuum')
  ThrustModel? get thrustVacuum;
  @override
  @JsonKey(name: 'thrust_to_weight')
  double? get thrustToWeight;
  @override
  @JsonKey(ignore: true)
  _$$EnginesModelImplCopyWith<_$EnginesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PayloadWeightModel _$PayloadWeightModelFromJson(Map<String, dynamic> json) {
  return _PayloadWeightModel.fromJson(json);
}

/// @nodoc
mixin _$PayloadWeightModel {
  int? get kg => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PayloadWeightModelCopyWith<PayloadWeightModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayloadWeightModelCopyWith<$Res> {
  factory $PayloadWeightModelCopyWith(
          PayloadWeightModel value, $Res Function(PayloadWeightModel) then) =
      _$PayloadWeightModelCopyWithImpl<$Res, PayloadWeightModel>;
  @useResult
  $Res call({int? kg, String? name});
}

/// @nodoc
class _$PayloadWeightModelCopyWithImpl<$Res, $Val extends PayloadWeightModel>
    implements $PayloadWeightModelCopyWith<$Res> {
  _$PayloadWeightModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kg = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      kg: freezed == kg
          ? _value.kg
          : kg // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PayloadWeightModelImplCopyWith<$Res>
    implements $PayloadWeightModelCopyWith<$Res> {
  factory _$$PayloadWeightModelImplCopyWith(_$PayloadWeightModelImpl value,
          $Res Function(_$PayloadWeightModelImpl) then) =
      __$$PayloadWeightModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? kg, String? name});
}

/// @nodoc
class __$$PayloadWeightModelImplCopyWithImpl<$Res>
    extends _$PayloadWeightModelCopyWithImpl<$Res, _$PayloadWeightModelImpl>
    implements _$$PayloadWeightModelImplCopyWith<$Res> {
  __$$PayloadWeightModelImplCopyWithImpl(_$PayloadWeightModelImpl _value,
      $Res Function(_$PayloadWeightModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kg = freezed,
    Object? name = freezed,
  }) {
    return _then(_$PayloadWeightModelImpl(
      kg: freezed == kg
          ? _value.kg
          : kg // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PayloadWeightModelImpl implements _PayloadWeightModel {
  const _$PayloadWeightModelImpl({this.kg, this.name});

  factory _$PayloadWeightModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PayloadWeightModelImplFromJson(json);

  @override
  final int? kg;
  @override
  final String? name;

  @override
  String toString() {
    return 'PayloadWeightModel(kg: $kg, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayloadWeightModelImpl &&
            (identical(other.kg, kg) || other.kg == kg) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, kg, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PayloadWeightModelImplCopyWith<_$PayloadWeightModelImpl> get copyWith =>
      __$$PayloadWeightModelImplCopyWithImpl<_$PayloadWeightModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PayloadWeightModelImplToJson(
      this,
    );
  }
}

abstract class _PayloadWeightModel implements PayloadWeightModel {
  const factory _PayloadWeightModel({final int? kg, final String? name}) =
      _$PayloadWeightModelImpl;

  factory _PayloadWeightModel.fromJson(Map<String, dynamic> json) =
      _$PayloadWeightModelImpl.fromJson;

  @override
  int? get kg;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$PayloadWeightModelImplCopyWith<_$PayloadWeightModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RocketModel _$RocketModelFromJson(Map<String, dynamic> json) {
  return _RocketModel.fromJson(json);
}

/// @nodoc
mixin _$RocketModel {
// Basic Fields
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get company => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get wikipedia => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_flight')
  String? get firstFlight =>
      throw _privateConstructorUsedError; // Numeric Fields
  @JsonKey(name: 'active')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'stages')
  int? get stages => throw _privateConstructorUsedError;
  @JsonKey(name: 'boosters')
  int? get boosters => throw _privateConstructorUsedError;
  @JsonKey(name: 'cost_per_launch')
  int? get costPerLaunch => throw _privateConstructorUsedError;
  @JsonKey(name: 'success_rate_pct')
  int? get successRatePct =>
      throw _privateConstructorUsedError; // Nested Objects
  @JsonKey(name: 'height')
  DimensionModel? get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'diameter')
  DimensionModel? get diameter => throw _privateConstructorUsedError;
  @JsonKey(name: 'mass')
  MassModel? get mass => throw _privateConstructorUsedError;
  @JsonKey(name: 'engines')
  EnginesModel? get engines => throw _privateConstructorUsedError;
  @JsonKey(name: 'landing_legs')
  LandingLegsModel? get landingLegs =>
      throw _privateConstructorUsedError; // Nested List
  @JsonKey(name: 'payload_weights')
  List<PayloadWeightModel>? get payloadWeights =>
      throw _privateConstructorUsedError;

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
      {String? id,
      String? name,
      String? type,
      String? company,
      String? country,
      String? description,
      String? wikipedia,
      @JsonKey(name: 'first_flight') String? firstFlight,
      @JsonKey(name: 'active') bool? isActive,
      @JsonKey(name: 'stages') int? stages,
      @JsonKey(name: 'boosters') int? boosters,
      @JsonKey(name: 'cost_per_launch') int? costPerLaunch,
      @JsonKey(name: 'success_rate_pct') int? successRatePct,
      @JsonKey(name: 'height') DimensionModel? height,
      @JsonKey(name: 'diameter') DimensionModel? diameter,
      @JsonKey(name: 'mass') MassModel? mass,
      @JsonKey(name: 'engines') EnginesModel? engines,
      @JsonKey(name: 'landing_legs') LandingLegsModel? landingLegs,
      @JsonKey(name: 'payload_weights')
      List<PayloadWeightModel>? payloadWeights});

  $DimensionModelCopyWith<$Res>? get height;
  $DimensionModelCopyWith<$Res>? get diameter;
  $MassModelCopyWith<$Res>? get mass;
  $EnginesModelCopyWith<$Res>? get engines;
  $LandingLegsModelCopyWith<$Res>? get landingLegs;
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
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? company = freezed,
    Object? country = freezed,
    Object? description = freezed,
    Object? wikipedia = freezed,
    Object? firstFlight = freezed,
    Object? isActive = freezed,
    Object? stages = freezed,
    Object? boosters = freezed,
    Object? costPerLaunch = freezed,
    Object? successRatePct = freezed,
    Object? height = freezed,
    Object? diameter = freezed,
    Object? mass = freezed,
    Object? engines = freezed,
    Object? landingLegs = freezed,
    Object? payloadWeights = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      wikipedia: freezed == wikipedia
          ? _value.wikipedia
          : wikipedia // ignore: cast_nullable_to_non_nullable
              as String?,
      firstFlight: freezed == firstFlight
          ? _value.firstFlight
          : firstFlight // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      stages: freezed == stages
          ? _value.stages
          : stages // ignore: cast_nullable_to_non_nullable
              as int?,
      boosters: freezed == boosters
          ? _value.boosters
          : boosters // ignore: cast_nullable_to_non_nullable
              as int?,
      costPerLaunch: freezed == costPerLaunch
          ? _value.costPerLaunch
          : costPerLaunch // ignore: cast_nullable_to_non_nullable
              as int?,
      successRatePct: freezed == successRatePct
          ? _value.successRatePct
          : successRatePct // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as DimensionModel?,
      diameter: freezed == diameter
          ? _value.diameter
          : diameter // ignore: cast_nullable_to_non_nullable
              as DimensionModel?,
      mass: freezed == mass
          ? _value.mass
          : mass // ignore: cast_nullable_to_non_nullable
              as MassModel?,
      engines: freezed == engines
          ? _value.engines
          : engines // ignore: cast_nullable_to_non_nullable
              as EnginesModel?,
      landingLegs: freezed == landingLegs
          ? _value.landingLegs
          : landingLegs // ignore: cast_nullable_to_non_nullable
              as LandingLegsModel?,
      payloadWeights: freezed == payloadWeights
          ? _value.payloadWeights
          : payloadWeights // ignore: cast_nullable_to_non_nullable
              as List<PayloadWeightModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DimensionModelCopyWith<$Res>? get height {
    if (_value.height == null) {
      return null;
    }

    return $DimensionModelCopyWith<$Res>(_value.height!, (value) {
      return _then(_value.copyWith(height: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DimensionModelCopyWith<$Res>? get diameter {
    if (_value.diameter == null) {
      return null;
    }

    return $DimensionModelCopyWith<$Res>(_value.diameter!, (value) {
      return _then(_value.copyWith(diameter: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MassModelCopyWith<$Res>? get mass {
    if (_value.mass == null) {
      return null;
    }

    return $MassModelCopyWith<$Res>(_value.mass!, (value) {
      return _then(_value.copyWith(mass: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EnginesModelCopyWith<$Res>? get engines {
    if (_value.engines == null) {
      return null;
    }

    return $EnginesModelCopyWith<$Res>(_value.engines!, (value) {
      return _then(_value.copyWith(engines: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LandingLegsModelCopyWith<$Res>? get landingLegs {
    if (_value.landingLegs == null) {
      return null;
    }

    return $LandingLegsModelCopyWith<$Res>(_value.landingLegs!, (value) {
      return _then(_value.copyWith(landingLegs: value) as $Val);
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
      {String? id,
      String? name,
      String? type,
      String? company,
      String? country,
      String? description,
      String? wikipedia,
      @JsonKey(name: 'first_flight') String? firstFlight,
      @JsonKey(name: 'active') bool? isActive,
      @JsonKey(name: 'stages') int? stages,
      @JsonKey(name: 'boosters') int? boosters,
      @JsonKey(name: 'cost_per_launch') int? costPerLaunch,
      @JsonKey(name: 'success_rate_pct') int? successRatePct,
      @JsonKey(name: 'height') DimensionModel? height,
      @JsonKey(name: 'diameter') DimensionModel? diameter,
      @JsonKey(name: 'mass') MassModel? mass,
      @JsonKey(name: 'engines') EnginesModel? engines,
      @JsonKey(name: 'landing_legs') LandingLegsModel? landingLegs,
      @JsonKey(name: 'payload_weights')
      List<PayloadWeightModel>? payloadWeights});

  @override
  $DimensionModelCopyWith<$Res>? get height;
  @override
  $DimensionModelCopyWith<$Res>? get diameter;
  @override
  $MassModelCopyWith<$Res>? get mass;
  @override
  $EnginesModelCopyWith<$Res>? get engines;
  @override
  $LandingLegsModelCopyWith<$Res>? get landingLegs;
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
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? company = freezed,
    Object? country = freezed,
    Object? description = freezed,
    Object? wikipedia = freezed,
    Object? firstFlight = freezed,
    Object? isActive = freezed,
    Object? stages = freezed,
    Object? boosters = freezed,
    Object? costPerLaunch = freezed,
    Object? successRatePct = freezed,
    Object? height = freezed,
    Object? diameter = freezed,
    Object? mass = freezed,
    Object? engines = freezed,
    Object? landingLegs = freezed,
    Object? payloadWeights = freezed,
  }) {
    return _then(_$RocketModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      wikipedia: freezed == wikipedia
          ? _value.wikipedia
          : wikipedia // ignore: cast_nullable_to_non_nullable
              as String?,
      firstFlight: freezed == firstFlight
          ? _value.firstFlight
          : firstFlight // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      stages: freezed == stages
          ? _value.stages
          : stages // ignore: cast_nullable_to_non_nullable
              as int?,
      boosters: freezed == boosters
          ? _value.boosters
          : boosters // ignore: cast_nullable_to_non_nullable
              as int?,
      costPerLaunch: freezed == costPerLaunch
          ? _value.costPerLaunch
          : costPerLaunch // ignore: cast_nullable_to_non_nullable
              as int?,
      successRatePct: freezed == successRatePct
          ? _value.successRatePct
          : successRatePct // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as DimensionModel?,
      diameter: freezed == diameter
          ? _value.diameter
          : diameter // ignore: cast_nullable_to_non_nullable
              as DimensionModel?,
      mass: freezed == mass
          ? _value.mass
          : mass // ignore: cast_nullable_to_non_nullable
              as MassModel?,
      engines: freezed == engines
          ? _value.engines
          : engines // ignore: cast_nullable_to_non_nullable
              as EnginesModel?,
      landingLegs: freezed == landingLegs
          ? _value.landingLegs
          : landingLegs // ignore: cast_nullable_to_non_nullable
              as LandingLegsModel?,
      payloadWeights: freezed == payloadWeights
          ? _value._payloadWeights
          : payloadWeights // ignore: cast_nullable_to_non_nullable
              as List<PayloadWeightModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RocketModelImpl extends _RocketModel {
  const _$RocketModelImpl(
      {this.id,
      this.name,
      this.type,
      this.company,
      this.country,
      this.description,
      this.wikipedia,
      @JsonKey(name: 'first_flight') this.firstFlight,
      @JsonKey(name: 'active') this.isActive,
      @JsonKey(name: 'stages') this.stages,
      @JsonKey(name: 'boosters') this.boosters,
      @JsonKey(name: 'cost_per_launch') this.costPerLaunch,
      @JsonKey(name: 'success_rate_pct') this.successRatePct,
      @JsonKey(name: 'height') this.height,
      @JsonKey(name: 'diameter') this.diameter,
      @JsonKey(name: 'mass') this.mass,
      @JsonKey(name: 'engines') this.engines,
      @JsonKey(name: 'landing_legs') this.landingLegs,
      @JsonKey(name: 'payload_weights')
      final List<PayloadWeightModel>? payloadWeights})
      : _payloadWeights = payloadWeights,
        super._();

  factory _$RocketModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RocketModelImplFromJson(json);

// Basic Fields
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? type;
  @override
  final String? company;
  @override
  final String? country;
  @override
  final String? description;
  @override
  final String? wikipedia;
  @override
  @JsonKey(name: 'first_flight')
  final String? firstFlight;
// Numeric Fields
  @override
  @JsonKey(name: 'active')
  final bool? isActive;
  @override
  @JsonKey(name: 'stages')
  final int? stages;
  @override
  @JsonKey(name: 'boosters')
  final int? boosters;
  @override
  @JsonKey(name: 'cost_per_launch')
  final int? costPerLaunch;
  @override
  @JsonKey(name: 'success_rate_pct')
  final int? successRatePct;
// Nested Objects
  @override
  @JsonKey(name: 'height')
  final DimensionModel? height;
  @override
  @JsonKey(name: 'diameter')
  final DimensionModel? diameter;
  @override
  @JsonKey(name: 'mass')
  final MassModel? mass;
  @override
  @JsonKey(name: 'engines')
  final EnginesModel? engines;
  @override
  @JsonKey(name: 'landing_legs')
  final LandingLegsModel? landingLegs;
// Nested List
  final List<PayloadWeightModel>? _payloadWeights;
// Nested List
  @override
  @JsonKey(name: 'payload_weights')
  List<PayloadWeightModel>? get payloadWeights {
    final value = _payloadWeights;
    if (value == null) return null;
    if (_payloadWeights is EqualUnmodifiableListView) return _payloadWeights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RocketModel(id: $id, name: $name, type: $type, company: $company, country: $country, description: $description, wikipedia: $wikipedia, firstFlight: $firstFlight, isActive: $isActive, stages: $stages, boosters: $boosters, costPerLaunch: $costPerLaunch, successRatePct: $successRatePct, height: $height, diameter: $diameter, mass: $mass, engines: $engines, landingLegs: $landingLegs, payloadWeights: $payloadWeights)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RocketModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.wikipedia, wikipedia) ||
                other.wikipedia == wikipedia) &&
            (identical(other.firstFlight, firstFlight) ||
                other.firstFlight == firstFlight) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.stages, stages) || other.stages == stages) &&
            (identical(other.boosters, boosters) ||
                other.boosters == boosters) &&
            (identical(other.costPerLaunch, costPerLaunch) ||
                other.costPerLaunch == costPerLaunch) &&
            (identical(other.successRatePct, successRatePct) ||
                other.successRatePct == successRatePct) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.diameter, diameter) ||
                other.diameter == diameter) &&
            (identical(other.mass, mass) || other.mass == mass) &&
            (identical(other.engines, engines) || other.engines == engines) &&
            (identical(other.landingLegs, landingLegs) ||
                other.landingLegs == landingLegs) &&
            const DeepCollectionEquality()
                .equals(other._payloadWeights, _payloadWeights));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        type,
        company,
        country,
        description,
        wikipedia,
        firstFlight,
        isActive,
        stages,
        boosters,
        costPerLaunch,
        successRatePct,
        height,
        diameter,
        mass,
        engines,
        landingLegs,
        const DeepCollectionEquality().hash(_payloadWeights)
      ]);

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

abstract class _RocketModel extends RocketModel {
  const factory _RocketModel(
      {final String? id,
      final String? name,
      final String? type,
      final String? company,
      final String? country,
      final String? description,
      final String? wikipedia,
      @JsonKey(name: 'first_flight') final String? firstFlight,
      @JsonKey(name: 'active') final bool? isActive,
      @JsonKey(name: 'stages') final int? stages,
      @JsonKey(name: 'boosters') final int? boosters,
      @JsonKey(name: 'cost_per_launch') final int? costPerLaunch,
      @JsonKey(name: 'success_rate_pct') final int? successRatePct,
      @JsonKey(name: 'height') final DimensionModel? height,
      @JsonKey(name: 'diameter') final DimensionModel? diameter,
      @JsonKey(name: 'mass') final MassModel? mass,
      @JsonKey(name: 'engines') final EnginesModel? engines,
      @JsonKey(name: 'landing_legs') final LandingLegsModel? landingLegs,
      @JsonKey(name: 'payload_weights')
      final List<PayloadWeightModel>? payloadWeights}) = _$RocketModelImpl;
  const _RocketModel._() : super._();

  factory _RocketModel.fromJson(Map<String, dynamic> json) =
      _$RocketModelImpl.fromJson;

  @override // Basic Fields
  String? get id;
  @override
  String? get name;
  @override
  String? get type;
  @override
  String? get company;
  @override
  String? get country;
  @override
  String? get description;
  @override
  String? get wikipedia;
  @override
  @JsonKey(name: 'first_flight')
  String? get firstFlight;
  @override // Numeric Fields
  @JsonKey(name: 'active')
  bool? get isActive;
  @override
  @JsonKey(name: 'stages')
  int? get stages;
  @override
  @JsonKey(name: 'boosters')
  int? get boosters;
  @override
  @JsonKey(name: 'cost_per_launch')
  int? get costPerLaunch;
  @override
  @JsonKey(name: 'success_rate_pct')
  int? get successRatePct;
  @override // Nested Objects
  @JsonKey(name: 'height')
  DimensionModel? get height;
  @override
  @JsonKey(name: 'diameter')
  DimensionModel? get diameter;
  @override
  @JsonKey(name: 'mass')
  MassModel? get mass;
  @override
  @JsonKey(name: 'engines')
  EnginesModel? get engines;
  @override
  @JsonKey(name: 'landing_legs')
  LandingLegsModel? get landingLegs;
  @override // Nested List
  @JsonKey(name: 'payload_weights')
  List<PayloadWeightModel>? get payloadWeights;
  @override
  @JsonKey(ignore: true)
  _$$RocketModelImplCopyWith<_$RocketModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
