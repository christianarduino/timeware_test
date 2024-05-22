import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:timeware_test/src/shared/user/data/local/user_local_data_source.dart';

class UserLocalDataSourceImpl extends UserLocalDataSource {
  final FlutterSecureStorage _storage;

  UserLocalDataSourceImpl({required FlutterSecureStorage storage})
      : _storage = storage;

  final _loginKey = 'login';
  final _isLoggedIn = 'isLoggedIn';
  final _isLoggedOut = 'isLoggedOut';

  @override
  Future<bool> getUserState() async {
    final res = await _storage.read(key: _loginKey);
    return res == _isLoggedIn;
  }

  @override
  Future<void> saveUserState(bool login) async {
    await _storage.write(
        key: _loginKey, value: login ? _isLoggedIn : _isLoggedOut);
  }
}
