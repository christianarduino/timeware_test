import 'package:json_annotation/json_annotation.dart';
import 'package:timeware_test/src/features/vulnerable_species/data/model/network_vulnerable_species_list_data.dart';

part 'network_vulnerable_species_list.g.dart';

@JsonSerializable()
class NetworkVulnerableSpeciesList {
  final int count;
  final String category;
  final List<NetworkVulnerableSpeciesListData> result;

  NetworkVulnerableSpeciesList(this.count, this.category, this.result);

  factory NetworkVulnerableSpeciesList.fromJson(Map<String, dynamic> json) =>
      _$NetworkVulnerableSpeciesListFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkVulnerableSpeciesListToJson(this);
}
