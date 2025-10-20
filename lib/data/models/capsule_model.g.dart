// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capsule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CapsuleModelImpl _$$CapsuleModelImplFromJson(Map<String, dynamic> json) =>
    _$CapsuleModelImpl(
      id: json['id'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
      reuseCount: (json['reuse_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CapsuleModelImplToJson(_$CapsuleModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'type': instance.type,
      'reuse_count': instance.reuseCount,
    };
