import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/config_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final ConfigRepository _repo;

  AuthCubit(this._repo) : super(AuthInitial());

  Future<void> checkAuthStatus() async {
    // For now, always lock on start
    emit(AuthLocked());
  }

  Future<void> login(String password) async {
    try {
      final config = await _repo.getAppConfig();
      if (config.password == password) {
        emit(AuthAuthenticated());
      } else {
        emit(AuthError("Contraseña incorrecta"));
        // Reset to Locked (or keep error state, but UI needs handle)
         emit(AuthLocked()); // Emit locked again but maybe with error? 
         // Actually better to have UI listen to error, show snackbar.
         // But state must remain locked.
      }
    } catch (e) {
      emit(AuthError("Error: $e"));
      emit(AuthLocked());
    }
  }

  Future<bool> verifyPassword(String password) async {
    try {
      final config = await _repo.getAppConfig();
      return config.password == password;
    } catch (e) {
      return false;
    }
  }

  Future<bool> changePassword(String oldPassword, String newPassword) async {
    try {
      final config = await _repo.getAppConfig();
      if (config.password == oldPassword) {
        config.password = newPassword;
        await _repo.saveAppConfig(config);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
