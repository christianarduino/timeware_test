abstract class UserLocalDataSource {
  Future<bool> getUserState();
  Future<void> saveUserState(bool login);
}
