abstract class UserRepository {
  Future<bool> getUserState();
  Future<void> saveUserState(bool login);
}
