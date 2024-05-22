import 'package:timeware_test/src/features/vulnerable_species/data/remote/vulnerable_species_remote_data_source.dart';
import 'package:timeware_test/src/features/vulnerable_species/domain/model/vulnerable_species_detail.dart';
import 'package:timeware_test/src/features/vulnerable_species/domain/model/vulnerable_species_list_data.dart';
import 'package:timeware_test/src/features/vulnerable_species/domain/repositories/vulnerable_species_repository.dart';

class VulnerableSpeciesRepositoryImpl extends VulnerableSpeciesRepository {
  final VulnerableSpeciesRemoteDataSource _remoteDataSource;

  VulnerableSpeciesRepositoryImpl({
    required VulnerableSpeciesRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<List<VulnerableSpeciesListData>> getVulnerableSpecies() {
    return _remoteDataSource.getVulnerableSpecies();
  }

  @override
  Future<VulnerableSpeciesDetail> getVulnerableSpeciesDetail(String name) {
    return _remoteDataSource.getVulnerableSpeciesDetail(name);
  }
}
