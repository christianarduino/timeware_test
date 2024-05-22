import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:timeware_test/src/features/vulnerable_species/domain/model/vulnerable_species_list_data.dart';
import 'package:timeware_test/src/features/vulnerable_species/presentation/view_model/vulnerable_species_view_model.dart';
import 'package:timeware_test/src/features/vulnerable_species/presentation/widgets/top_container.dart';
import 'package:timeware_test/src/shared/app_router.dart';
import 'package:timeware_test/src/shared/di/injector.dart';

class VulnerableSpeciesPage extends StatelessWidget {
  const VulnerableSpeciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector.get<VulnerableSpeciesViewModel>()..fetchVulnerableSpecies(),
      child: const VulnerableSpeciesBody(),
    );
  }
}

class VulnerableSpeciesBody extends StatelessWidget {
  const VulnerableSpeciesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopContainer(text: 'Specie Vulnerabili'),
          const SizedBox(height: 4),
          BlocBuilder<VulnerableSpeciesViewModel, List<VulnerableSpeciesListData>?>(
              builder: (context, data) {
            if (data == null) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (data.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'Non sono presenti specie vulnerabili',
                  ),
                ),
              );
            }

            return Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                itemCount: data.length,
                itemBuilder: (_, int i) {
                  final vulnerableSpecies = data[i];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(vulnerableSpecies.name),
                    subtitle: vulnerableSpecies.subspecies == null
                        ? null
                        : Text(
                            vulnerableSpecies.subspecies!,
                          ),
                    onTap: () {
                      context.goNamed(
                        AppRoute.vulnerableSpeciesDetail.name,
                        pathParameters: {
                          'name': vulnerableSpecies.name,
                        },
                      );
                    },
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
