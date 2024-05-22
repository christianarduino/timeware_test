import 'package:timeware_test/src/features/vulnerable_species/data/model/network_vulnerable_species_list_data.dart';
import 'package:timeware_test/src/features/vulnerable_species/domain/model/vulnerable_species_list_data.dart';

extension NetworkVulnerableSpeciesListDataMapper on NetworkVulnerableSpeciesListData {
  VulnerableSpeciesListData get toDomain => VulnerableSpeciesListData(
        id: id,
        name: scientificName,
        subspecies: subspecies,
      );
}
