import 'package:dio/dio.dart';
import 'package:timeware_test/src/features/vulnerable_species/data/mapper/network_vulnerable_species_detail_mapper.dart';
import 'package:timeware_test/src/features/vulnerable_species/data/mapper/network_vulnerable_species_list_data_mapper.dart';
import 'package:timeware_test/src/features/vulnerable_species/data/model/network_vulnerable_species_detail.dart';
import 'package:timeware_test/src/features/vulnerable_species/data/model/network_vulnerable_species_list.dart';
import 'package:timeware_test/src/features/vulnerable_species/data/remote/vulnerable_species_remote_data_source.dart';
import 'package:timeware_test/src/features/vulnerable_species/domain/model/vulnerable_species_detail.dart';
import 'package:timeware_test/src/features/vulnerable_species/domain/model/vulnerable_species_list_data.dart';

class VulnerableSpeciesRemoteDataSourceImpl extends VulnerableSpeciesRemoteDataSource {
  final Dio _dio;

  VulnerableSpeciesRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<VulnerableSpeciesListData>> getVulnerableSpecies() async {
    try {
      final response = await _dio.get('/species/category/VU');
      final vulnerableSpeciesList = NetworkVulnerableSpeciesList.fromJson(response.data);

      return vulnerableSpeciesList.result.map((e) => e.toDomain).toList();
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<VulnerableSpeciesDetail> getVulnerableSpeciesDetail(String name) async {
    try {
      final response = await _dio.get('/species/narrative/$name');

      return NetworkVulnerableSpeciesDetail.fromJson(response.data).toDomain;
    } catch (err) {
      return VulnerableSpeciesDetail.empty();
    }
  }
}
