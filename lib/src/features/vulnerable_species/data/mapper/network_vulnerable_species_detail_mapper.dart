import 'package:timeware_test/src/features/vulnerable_species/data/model/network_vulnerable_species_detail.dart';
import 'package:timeware_test/src/features/vulnerable_species/domain/model/vulnerable_species_detail.dart';

extension NetworkVulnerableSpeciesDetailMapper on NetworkVulnerableSpeciesDetail {
  VulnerableSpeciesDetail get toDomain => VulnerableSpeciesDetail(
        name: name,
        taxonomicnotes: result.firstOrNull?.taxonomicnotes,
        rationale: result.firstOrNull?.rationale,
        geographicrange: result.firstOrNull?.geographicrange,
        population: result.firstOrNull?.population,
        populationtrend: result.firstOrNull?.populationtrend,
        habitat: result.firstOrNull?.habitat,
        threats: result.firstOrNull?.threats,
        conservationmeasures: result.firstOrNull?.conservationmeasures,
        usetrade: result.firstOrNull?.usetrade,
      );
}
