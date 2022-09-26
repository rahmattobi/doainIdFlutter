// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoaModel _$DoaModelFromJson(Map<String, dynamic> json) => DoaModel(
      id: json['id'] as String?,
      doa: json['doa'] as String?,
      ayat: json['ayat'] as String?,
      latin: json['latin'] as String?,
      artinya: json['artinya'] as String?,
    );

Map<String, dynamic> _$DoaModelToJson(DoaModel instance) => <String, dynamic>{
      'id': instance.id,
      'doa': instance.doa,
      'ayat': instance.ayat,
      'latin': instance.latin,
      'artinya': instance.artinya,
    };
