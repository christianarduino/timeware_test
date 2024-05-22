import 'package:timeware_test/src/shared/user/data/local/user_local_data_source.dart';
import 'package:timeware_test/src/shared/user/domain/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserLocalDataSource _dataSource;

  UserRepositoryImpl({required UserLocalDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<bool> getUserState() {
    return _dataSource.getUserState();
  }

  @override
  Future<void> saveUserState(bool login) async {
    await _dataSource.saveUserState(login);
  }
}
