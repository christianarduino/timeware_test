import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeware_test/src/features/vulnerable_species/domain/model/vulnerable_species_list_data.dart';
import 'package:timeware_test/src/features/vulnerable_species/domain/repositories/vulnerable_species_repository.dart';

class VulnerableSpeciesViewModel extends Cubit<List<VulnerableSpeciesListData>?> {
  final VulnerableSpeciesRepository _repository;

  VulnerableSpeciesViewModel({required VulnerableSpeciesRepository repository})
      : _repository = repository,
        super(null);

  void fetchVulnerableSpecies() async {
    try {
      final response = await _repository.getVulnerableSpecies();
      emit(response);
    } catch (err) {
      emit([]);
    }
  }
}
