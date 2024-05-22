import 'package:json_annotation/json_annotation.dart';

part 'network_vulnerable_species_detail.g.dart';

@JsonSerializable()
class NetworkVulnerableSpeciesDetail {
  final String name;
  final List<NetworkVulnerableSpeciesDetailData> result;

  NetworkVulnerableSpeciesDetail(this.name, this.result);

  factory NetworkVulnerableSpeciesDetail.fromJson(Map<String, dynamic> json) =>
      _$NetworkVulnerableSpeciesDetailFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkVulnerableSpeciesDetailToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkVulnerableSpeciesDetailData {
  NetworkVulnerableSpeciesDetailData(
    this.speciesId,
    this.taxonomicnotes,
    this.rationale,
    this.geographicrange,
    this.population,
    this.populationtrend,
    this.habitat,
    this.threats,
    this.conservationmeasures,
    this.usetrade,
  );

  final int? speciesId;
  final String? taxonomicnotes;
  final String? rationale;
  final String? geographicrange;
  final String? population;
  final String? populationtrend;
  final String? habitat;
  final String? threats;
  final String? conservationmeasures;
  final String? usetrade;

  factory NetworkVulnerableSpeciesDetailData.fromJson(Map<String, dynamic> json) =>
      _$NetworkVulnerableSpeciesDetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkVulnerableSpeciesDetailDataToJson(this);
}
