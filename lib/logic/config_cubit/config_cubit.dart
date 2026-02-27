import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/local/file_helper.dart';
import '../../data/models/organization_config.dart';
import '../../data/repositories/config_repository.dart';
import 'config_state.dart';

class ConfigCubit extends Cubit<ConfigState> {
  final ConfigRepository _repo;

  ConfigCubit(this._repo) : super(ConfigInitial());

  Future<void> loadConfig([int? selectedId]) async {
    emit(ConfigLoading());
    try {
      final all = await _repo.getAllConfigs();
      var current = await _repo.getConfig(selectedId);
      
      // Profile Management Refinement:
      // If we have custom profiles (anything other than "Predeterminado"), 
      // we should hide "Predeterminado" and ensure we are not selected on it.
      
      final customConfigs = all.where((c) => c.profileName != "Predeterminado").toList();
      
      List<OrganizationConfig> emitList;
      
      if (customConfigs.isNotEmpty) {
        // We have custom profiles -> Hide Default
        emitList = customConfigs;
        
        // Ensure current is not "Predeterminado" (or null/invalid)
        if (current.profileName == "Predeterminado" || !emitList.any((c) => c.id == current.id)) {
           // Switch to first available custom profile
           current = emitList.first;
        }
      } else {
        // Only default exists -> Show it
        emitList = all;
      }

      emit(ConfigLoaded(current, emitList));
    } catch (e) {
      emit(ConfigError("Failed to load config: $e"));
    }
  }

  Future<void> saveConfig(OrganizationConfig config) async {
    // Current State helper
    List<OrganizationConfig> currentAll = [];
    if (state is ConfigLoaded) currentAll = (state as ConfigLoaded).allConfigs;

    emit(ConfigLoading());
    try {
      await _repo.saveConfig(config);
      // Reload everything to ensure consistency
      await loadConfig(config.id);
    } catch (e) {
       emit(ConfigError("Failed to save config: $e"));
    }
  }
  
  Future<void> deleteConfig(int id) async {
    try {
       // Delete physical images if any
       final configToDelete = await _repo.getConfig(id);
       if (configToDelete.logoPath != null) await FileHelper.deleteLocalImage(configToDelete.logoPath);
       if (configToDelete.signaturePath != null) await FileHelper.deleteLocalImage(configToDelete.signaturePath);
       if (configToDelete.stampPath != null) await FileHelper.deleteLocalImage(configToDelete.stampPath);

       await _repo.deleteConfig(id);
       await loadConfig(); // Load default
    } catch (e) {
       emit(ConfigError("Failed to delete: $e"));
    }
  }
  
  Future<void> createProfile(String name) async {
     final newConfig = OrganizationConfig()..profileName = name;
     await saveConfig(newConfig);
  }

  Future<void> wipeData() async {
    try {
      await _repo.clearAllData(); // Needs to be added to repo
      await FileHelper.wipeImagesDirectory();
      emit(ConfigInitial());
      await loadConfig();
    } catch (e) {
      emit(ConfigError("Failed to wipe data: $e"));
    }
  }
}
