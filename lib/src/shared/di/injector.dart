import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:timeware_test/src/features/vulnerable_species/data/remote/vulnerable_species_remote_data_source.dart';
import 'package:timeware_test/src/features/vulnerable_species/data/remote/vulnerable_species_remote_data_source_impl.dart';
import 'package:timeware_test/src/features/vulnerable_species/data/repositories/vulnerable_species_repository_impl.dart';
import 'package:timeware_test/src/features/vulnerable_species/domain/repositories/vulnerable_species_repository.dart';
import 'package:timeware_test/src/features/vulnerable_species/presentation/view_model/vulnerable_species_detail_view_model.dart';
import 'package:timeware_test/src/features/vulnerable_species/presentation/view_model/vulnerable_species_view_model.dart';
import 'package:timeware_test/src/shared/dio/interceptors.dart';
import 'package:timeware_test/src/shared/user/data/local/user_local_data_source.dart';
import 'package:timeware_test/src/shared/user/data/local/user_local_data_source_impl.dart';
import 'package:timeware_test/src/shared/user/data/repositories/user_repository_impl.dart';
import 'package:timeware_test/src/shared/user/domain/user_repository.dart';
import 'package:timeware_test/src/shared/user/presentation/view_model/user_view_model.dart';

final GetIt injector = GetIt.instance;

Future<void> initDi() async {
  _initUserDi();
  _initVulnerableSpecies();
}

_initUserDi() {
  injector.registerSingleton<UserLocalDataSource>(
    UserLocalDataSourceImpl(storage: const FlutterSecureStorage()),
  );
  injector.registerSingleton<UserRepository>(
    UserRepositoryImpl(
      dataSource: injector.get<UserLocalDataSource>(),
    ),
  );
  injector.registerLazySingleton(
    () => UserViewModel(null, injector.get<UserRepository>())..loadUserState(),
  );
}

void _initVulnerableSpecies() {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://apiv3.iucnredlist.org/api/v3/'),
  );
  dio.interceptors.add(LogInterceptor());
  dio.interceptors.add(CustomInterceptors());
  injector.registerSingleton<VulnerableSpeciesRemoteDataSource>(
    VulnerableSpeciesRemoteDataSourceImpl(dio: dio),
  );
  injector.registerSingleton<VulnerableSpeciesRepository>(
    VulnerableSpeciesRepositoryImpl(
      remoteDataSource: injector.get<VulnerableSpeciesRemoteDataSource>(),
    ),
  );
  injector.registerFactory<VulnerableSpeciesViewModel>(
    () => VulnerableSpeciesViewModel(
      repository: injector.get<VulnerableSpeciesRepository>(),
    ),
  );
  injector.registerFactory<VulnerableSpeciesDetailViewModel>(
    () => VulnerableSpeciesDetailViewModel(
      repository: injector.get<VulnerableSpeciesRepository>(),
    ),
  );
}
