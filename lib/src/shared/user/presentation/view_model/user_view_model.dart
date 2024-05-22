import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeware_test/src/shared/user/domain/user_repository.dart';

class UserViewModel extends Cubit<bool?> {
  UserViewModel(super.initialState, this._repository);

  final UserRepository _repository;

  Future<void> loadUserState() async {
    final isLoggedIn = await _repository.getUserState();
    emit(isLoggedIn);
  }

  Future<void> login() async {
    const newState = true;
    await _repository.saveUserState(newState);
    emit(newState);
  }

  Future<void> logout() async {
    const newState = false;
    await _repository.saveUserState(newState);
    emit(newState);
  }
}
