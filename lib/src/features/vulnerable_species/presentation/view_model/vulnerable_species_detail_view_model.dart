import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeware_test/src/features/vulnerable_species/domain/model/vulnerable_species_detail.dart';
import 'package:timeware_test/src/features/vulnerable_species/domain/repositories/vulnerable_species_repository.dart';

class VulnerableSpeciesDetailViewModel extends Cubit<VulnerableSpeciesDetail?> {
  final VulnerableSpeciesRepository _repository;

  VulnerableSpeciesDetailViewModel({required VulnerableSpeciesRepository repository})
      : _repository = repository,
        super(null);

  void fetchVulnerableSpeciesDetail(String name) async {
    final response = await _repository.getVulnerableSpeciesDetail(name);
    emit(response);
  }
}
