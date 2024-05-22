import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:timeware_test/src/shared/user/data/local/user_local_data_source.dart';
import 'package:timeware_test/src/shared/user/data/local/user_local_data_source_impl.dart';
import 'package:timeware_test/src/shared/user/data/repositories/user_repository_impl.dart';
import 'package:timeware_test/src/shared/user/domain/user_repository.dart';
import 'package:timeware_test/src/shared/user/presentation/view_model/user_view_model.dart';

final GetIt injector = GetIt.instance;

Future<void> initDi() async {
  _initUserDi();
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
