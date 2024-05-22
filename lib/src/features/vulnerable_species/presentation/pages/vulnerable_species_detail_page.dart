import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeware_test/src/features/vulnerable_species/presentation/view_model/vulnerable_species_detail_view_model.dart';
import 'package:timeware_test/src/features/vulnerable_species/presentation/widgets/species_tile.dart';
import 'package:timeware_test/src/features/vulnerable_species/presentation/widgets/top_container.dart';
import 'package:timeware_test/src/shared/di/injector.dart';
import 'package:timeware_test/src/shared/ext/string_ext.dart';

class VulnerableSpeciesDetailPage extends StatelessWidget {
  final String speciesName;

  const VulnerableSpeciesDetailPage({super.key, required this.speciesName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector.get<VulnerableSpeciesDetailViewModel>()
        ..fetchVulnerableSpeciesDetail(speciesName),
      child: VulnerableSpeciesDetailBody(speciesName: speciesName),
    );
  }
}

class VulnerableSpeciesDetailBody extends StatelessWidget {
  final String speciesName;

  const VulnerableSpeciesDetailBody({super.key, required this.speciesName});

  @override
  Widget build(BuildContext context) {
    final detailViewModel = context.watch<VulnerableSpeciesDetailViewModel>();
    final state = detailViewModel.state;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopContainer(
            text: speciesName,
            back: true,
          ),
          const SizedBox(height: 4),
          if (state != null && state.name == null)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child:
                    Text('Non sono presenti dati specifici su questa specie'),
              ),
            ),
          if (state == null)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          else
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                children: [
                  if (state.name.isValid)
                    SpeciesTile(
                      title: 'Nome',
                      subtitle: state.name!,
                    ),
                  if (state.taxonomicnotes.isValid)
                    SpeciesTile(
                      title: 'Tassonomia',
                      subtitle: state.taxonomicnotes!,
                    ),
                  if (state.rationale.isValid)
                    SpeciesTile(
                      title: 'Motivazione',
                      subtitle: state.rationale!,
                    ),
                  if (state.geographicrange.isValid)
                    SpeciesTile(
                      title: 'Area Geografica',
                      subtitle: state.geographicrange!,
                    ),
                  if (state.population.isValid)
                    SpeciesTile(
                      title: 'Popolazione',
                      subtitle: state.population!,
                    ),
                  if (state.populationtrend.isValid)
                    SpeciesTile(
                      title: 'Trend popolazione',
                      subtitle: state.populationtrend!,
                    ),
                  if (state.habitat.isValid)
                    SpeciesTile(
                      title: 'Habitat',
                      subtitle: state.habitat!,
                    ),
                  if (state.threats.isValid)
                    SpeciesTile(
                      title: 'Minacce principali',
                      subtitle: state.threats!,
                    ),
                  if (state.conservationmeasures.isValid)
                    SpeciesTile(
                      title: 'Misure di conservazione',
                      subtitle: state.conservationmeasures!,
                    ),
                  if (state.usetrade.isValid)
                    SpeciesTile(
                      title: 'Uso commmerciale',
                      subtitle: state.usetrade!,
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
