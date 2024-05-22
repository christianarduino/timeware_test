import 'package:timeware_test/src/features/vulnerable_species/domain/model/vulnerable_species_detail.dart';
import 'package:timeware_test/src/features/vulnerable_species/domain/model/vulnerable_species_list_data.dart';

abstract class VulnerableSpeciesRemoteDataSource {
  Future<List<VulnerableSpeciesListData>> getVulnerableSpecies();
  Future<VulnerableSpeciesDetail> getVulnerableSpeciesDetail(String name);
}
