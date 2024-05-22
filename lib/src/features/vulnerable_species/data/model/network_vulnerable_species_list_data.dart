import 'package:json_annotation/json_annotation.dart';

part 'network_vulnerable_species_list_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkVulnerableSpeciesListData {
  @JsonKey(name: 'taxonid')
  final int id;
  final String scientificName;
  final String? subspecies;
  final String? rank;
  final String? subpopulation;

  NetworkVulnerableSpeciesListData(
      this.id, this.scientificName, this.rank, this.subpopulation, this.subspecies);

  factory NetworkVulnerableSpeciesListData.fromJson(Map<String, dynamic> json) =>
      _$NetworkVulnerableSpeciesListDataFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkVulnerableSpeciesListDataToJson(this);
}
