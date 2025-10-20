// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DimensionModelImpl _$$DimensionModelImplFromJson(Map<String, dynamic> json) =>
    _$DimensionModelImpl(
      meters: (json['meters'] as num?)?.toDouble(),
      feet: (json['feet'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DimensionModelImplToJson(
        _$DimensionModelImpl instance) =>
    <String, dynamic>{
      'meters': instance.meters,
      'feet': instance.feet,
    };

_$MassModelImpl _$$MassModelImplFromJson(Map<String, dynamic> json) =>
    _$MassModelImpl(
      kg: (json['kg'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MassModelImplToJson(_$MassModelImpl instance) =>
    <String, dynamic>{
      'kg': instance.kg,
    };

_$LandingLegsModelImpl _$$LandingLegsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LandingLegsModelImpl(
      number: (json['number'] as num?)?.toInt(),
      material: json['material'] as String?,
    );

Map<String, dynamic> _$$LandingLegsModelImplToJson(
        _$LandingLegsModelImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'material': instance.material,
    };

_$ThrustModelImpl _$$ThrustModelImplFromJson(Map<String, dynamic> json) =>
    _$ThrustModelImpl(
      kN: (json['kN'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ThrustModelImplToJson(_$ThrustModelImpl instance) =>
    <String, dynamic>{
      'kN': instance.kN,
    };

_$EnginesModelImpl _$$EnginesModelImplFromJson(Map<String, dynamic> json) =>
    _$EnginesModelImpl(
      number: (json['number'] as num?)?.toInt(),
      type: json['type'] as String?,
      version: json['version'] as String?,
      layout: json['layout'] as String?,
      engineLossMax: json['engine_loss_max'] as String?,
      propellant1: json['propellant_1'] as String?,
      propellant2: json['propellant_2'] as String?,
      thrustSeaLevel: json['thrust_sea_level'] == null
          ? null
          : ThrustModel.fromJson(
              json['thrust_sea_level'] as Map<String, dynamic>),
      thrustVacuum: json['thrust_vacuum'] == null
          ? null
          : ThrustModel.fromJson(json['thrust_vacuum'] as Map<String, dynamic>),
      thrustToWeight: (json['thrust_to_weight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$EnginesModelImplToJson(_$EnginesModelImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'type': instance.type,
      'version': instance.version,
      'layout': instance.layout,
      'engine_loss_max': instance.engineLossMax,
      'propellant_1': instance.propellant1,
      'propellant_2': instance.propellant2,
      'thrust_sea_level': instance.thrustSeaLevel,
      'thrust_vacuum': instance.thrustVacuum,
      'thrust_to_weight': instance.thrustToWeight,
    };

_$PayloadWeightModelImpl _$$PayloadWeightModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PayloadWeightModelImpl(
      kg: (json['kg'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$PayloadWeightModelImplToJson(
        _$PayloadWeightModelImpl instance) =>
    <String, dynamic>{
      'kg': instance.kg,
      'name': instance.name,
    };

_$RocketModelImpl _$$RocketModelImplFromJson(Map<String, dynamic> json) =>
    _$RocketModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      company: json['company'] as String?,
      country: json['country'] as String?,
      description: json['description'] as String?,
      wikipedia: json['wikipedia'] as String?,
      firstFlight: json['first_flight'] as String?,
      isActive: json['active'] as bool?,
      stages: (json['stages'] as num?)?.toInt(),
      boosters: (json['boosters'] as num?)?.toInt(),
      costPerLaunch: (json['cost_per_launch'] as num?)?.toInt(),
      successRatePct: (json['success_rate_pct'] as num?)?.toInt(),
      height: json['height'] == null
          ? null
          : DimensionModel.fromJson(json['height'] as Map<String, dynamic>),
      diameter: json['diameter'] == null
          ? null
          : DimensionModel.fromJson(json['diameter'] as Map<String, dynamic>),
      mass: json['mass'] == null
          ? null
          : MassModel.fromJson(json['mass'] as Map<String, dynamic>),
      engines: json['engines'] == null
          ? null
          : EnginesModel.fromJson(json['engines'] as Map<String, dynamic>),
      landingLegs: json['landing_legs'] == null
          ? null
          : LandingLegsModel.fromJson(
              json['landing_legs'] as Map<String, dynamic>),
      payloadWeights: (json['payload_weights'] as List<dynamic>?)
          ?.map((e) => PayloadWeightModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RocketModelImplToJson(_$RocketModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'company': instance.company,
      'country': instance.country,
      'description': instance.description,
      'wikipedia': instance.wikipedia,
      'first_flight': instance.firstFlight,
      'active': instance.isActive,
      'stages': instance.stages,
      'boosters': instance.boosters,
      'cost_per_launch': instance.costPerLaunch,
      'success_rate_pct': instance.successRatePct,
      'height': instance.height,
      'diameter': instance.diameter,
      'mass': instance.mass,
      'engines': instance.engines,
      'landing_legs': instance.landingLegs,
      'payload_weights': instance.payloadWeights,
    };
