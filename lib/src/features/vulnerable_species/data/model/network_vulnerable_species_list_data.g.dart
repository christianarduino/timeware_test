// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_vulnerable_species_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkVulnerableSpeciesListData _$NetworkVulnerableSpeciesListDataFromJson(
        Map<String, dynamic> json) =>
    NetworkVulnerableSpeciesListData(
      (json['taxonid'] as num).toInt(),
      json['scientific_name'] as String,
      json['rank'] as String?,
      json['subpopulation'] as String?,
      json['subspecies'] as String?,
    );

Map<String, dynamic> _$NetworkVulnerableSpeciesListDataToJson(
        NetworkVulnerableSpeciesListData instance) =>
    <String, dynamic>{
      'taxonid': instance.id,
      'scientific_name': instance.scientificName,
      'subspecies': instance.subspecies,
      'rank': instance.rank,
      'subpopulation': instance.subpopulation,
    };
