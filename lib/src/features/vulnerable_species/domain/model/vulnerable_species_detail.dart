class VulnerableSpeciesDetail {
  final String? name;
  final String? taxonomicnotes;
  final String? rationale;
  final String? geographicrange;
  final String? population;
  final String? populationtrend;
  final String? habitat;
  final String? threats;
  final String? conservationmeasures;
  final String? usetrade;

  VulnerableSpeciesDetail({
    required this.name,
    required this.taxonomicnotes,
    required this.rationale,
    required this.geographicrange,
    required this.population,
    required this.populationtrend,
    required this.habitat,
    required this.threats,
    required this.conservationmeasures,
    required this.usetrade,
  });

  factory VulnerableSpeciesDetail.empty() {
    return VulnerableSpeciesDetail(
      name: null,
      taxonomicnotes: null,
      rationale: null,
      geographicrange: null,
      population: null,
      populationtrend: null,
      habitat: null,
      threats: null,
      conservationmeasures: null,
      usetrade: null,
    );
  }
}
