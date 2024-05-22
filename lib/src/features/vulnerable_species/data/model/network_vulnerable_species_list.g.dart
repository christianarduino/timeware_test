// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_vulnerable_species_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkVulnerableSpeciesList _$NetworkVulnerableSpeciesListFromJson(
        Map<String, dynamic> json) =>
    NetworkVulnerableSpeciesList(
      (json['count'] as num).toInt(),
      json['category'] as String,
      (json['result'] as List<dynamic>)
          .map((e) => NetworkVulnerableSpeciesListData.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NetworkVulnerableSpeciesListToJson(
        NetworkVulnerableSpeciesList instance) =>
    <String, dynamic>{
      'count': instance.count,
      'category': instance.category,
      'result': instance.result,
    };
