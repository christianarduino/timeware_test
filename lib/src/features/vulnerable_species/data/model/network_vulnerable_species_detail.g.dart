// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_vulnerable_species_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkVulnerableSpeciesDetail _$NetworkVulnerableSpeciesDetailFromJson(
        Map<String, dynamic> json) =>
    NetworkVulnerableSpeciesDetail(
      json['name'] as String,
      (json['result'] as List<dynamic>)
          .map((e) => NetworkVulnerableSpeciesDetailData.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NetworkVulnerableSpeciesDetailToJson(
        NetworkVulnerableSpeciesDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'result': instance.result,
    };

NetworkVulnerableSpeciesDetailData _$NetworkVulnerableSpeciesDetailDataFromJson(
        Map<String, dynamic> json) =>
    NetworkVulnerableSpeciesDetailData(
      (json['species_id'] as num?)?.toInt(),
      json['taxonomicnotes'] as String?,
      json['rationale'] as String?,
      json['geographicrange'] as String?,
      json['population'] as String?,
      json['populationtrend'] as String?,
      json['habitat'] as String?,
      json['threats'] as String?,
      json['conservationmeasures'] as String?,
      json['usetrade'] as String?,
    );

Map<String, dynamic> _$NetworkVulnerableSpeciesDetailDataToJson(
        NetworkVulnerableSpeciesDetailData instance) =>
    <String, dynamic>{
      'species_id': instance.speciesId,
      'taxonomicnotes': instance.taxonomicnotes,
      'rationale': instance.rationale,
      'geographicrange': instance.geographicrange,
      'population': instance.population,
      'populationtrend': instance.populationtrend,
      'habitat': instance.habitat,
      'threats': instance.threats,
      'conservationmeasures': instance.conservationmeasures,
      'usetrade': instance.usetrade,
    };
