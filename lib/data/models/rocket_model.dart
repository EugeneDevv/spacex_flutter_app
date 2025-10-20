// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'rocket_model.freezed.dart';
part 'rocket_model.g.dart';

// --- Sub Models ---

/// Used for 'height' and 'diameter' properties
@freezed
class DimensionModel with _$DimensionModel {
  const factory DimensionModel({
    double? meters,
    double? feet,
  }) = _DimensionModel;

  factory DimensionModel.fromJson(Map<String, dynamic> json) =>
      _$DimensionModelFromJson(json);
}

/// Used for 'mass' property
@freezed
class MassModel with _$MassModel {
  const factory MassModel({
    int? kg,
  }) = _MassModel;

  factory MassModel.fromJson(Map<String, dynamic> json) =>
      _$MassModelFromJson(json);
}

/// Used for 'landing_legs' property
@freezed
class LandingLegsModel with _$LandingLegsModel {
  const factory LandingLegsModel({
    int? number,
    String? material,
  }) = _LandingLegsModel;

  factory LandingLegsModel.fromJson(Map<String, dynamic> json) =>
      _$LandingLegsModelFromJson(json);
}

/// Used for nested thrust values inside 'engines'
@freezed
class ThrustModel with _$ThrustModel {
  const factory ThrustModel({
    int? kN,
  }) = _ThrustModel;

  factory ThrustModel.fromJson(Map<String, dynamic> json) =>
      _$ThrustModelFromJson(json);
}

/// Used for 'engines' property
@freezed
class EnginesModel with _$EnginesModel {
  const factory EnginesModel({
    int? number,
    String? type,
    String? version,
    String? layout,
    // JSON provides a string "2", so we use String here.
    @JsonKey(name: 'engine_loss_max') String? engineLossMax,
    @JsonKey(name: 'propellant_1') String? propellant1,
    @JsonKey(name: 'propellant_2') String? propellant2,
    @JsonKey(name: 'thrust_sea_level') ThrustModel? thrustSeaLevel,
    @JsonKey(name: 'thrust_vacuum') ThrustModel? thrustVacuum,
    @JsonKey(name: 'thrust_to_weight') double? thrustToWeight,
  }) = _EnginesModel;

  factory EnginesModel.fromJson(Map<String, dynamic> json) =>
      _$EnginesModelFromJson(json);
}

/// Used for array items in 'payload_weights'
@freezed
class PayloadWeightModel with _$PayloadWeightModel {
  const factory PayloadWeightModel({
    int? kg,
    String? name,
  }) = _PayloadWeightModel;

  factory PayloadWeightModel.fromJson(Map<String, dynamic> json) =>
      _$PayloadWeightModelFromJson(json);
}

// --- Main Model ---

@freezed
class RocketModel with _$RocketModel {
  const RocketModel._();

  const factory RocketModel({
    // Basic Fields
    String? id,
    String? name,
    String? type,
    String? company,
    String? country,
    String? description,
    String? wikipedia,
    @JsonKey(name: 'first_flight') String? firstFlight,

    // Numeric Fields
    @JsonKey(name: 'active') bool? isActive,
    @JsonKey(name: 'stages') int? stages,
    @JsonKey(name: 'boosters') int? boosters,
    @JsonKey(name: 'cost_per_launch') int? costPerLaunch,
    @JsonKey(name: 'success_rate_pct') int? successRatePct,

    // Nested Objects
    @JsonKey(name: 'height') DimensionModel? height,
    @JsonKey(name: 'diameter') DimensionModel? diameter,
    @JsonKey(name: 'mass') MassModel? mass,
    @JsonKey(name: 'engines') EnginesModel? engines,
    @JsonKey(name: 'landing_legs') LandingLegsModel? landingLegs,

    // Nested List
    @JsonKey(name: 'payload_weights') List<PayloadWeightModel>? payloadWeights,
  }) = _RocketModel;

  factory RocketModel.fromJson(Map<String, dynamic> json) =>
      _$RocketModelFromJson(json);
}
