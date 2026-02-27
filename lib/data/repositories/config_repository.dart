import 'package:isar/isar.dart';
import '../local/database_service.dart';
import '../models/organization_config.dart';
import '../models/app_config.dart';

class ConfigRepository {
  final DatabaseService _dbService;

  ConfigRepository(this._dbService);

  // Get all configs to show in dropdown
  Future<List<OrganizationConfig>> getAllConfigs() async {
    final isar = await _dbService.db;
    return await isar.organizationConfigs.where().findAll();
  }

  // Get current selected config (by ID if stored, or default)
  // For now, let's assume we pass the ID, or get the first one if null.
  Future<OrganizationConfig> getConfig([int? id]) async {
    final isar = await _dbService.db;
    if (id != null) {
      final config = await isar.organizationConfigs.get(id);
      if (config != null) return config;
    }
    
    // Fallback: Get first or create default
    final first = await isar.organizationConfigs.where().findFirst();
    return first ?? OrganizationConfig()..profileName = "Predeterminado";
  }

  Future<void> saveConfig(OrganizationConfig config) async {
    final isar = await _dbService.db;
    await isar.writeTxn(() async {
      await isar.organizationConfigs.put(config);
    });
  }

  Future<void> deleteConfig(int id) async {
    final isar = await _dbService.db;
    await isar.writeTxn(() async {
      await isar.organizationConfigs.delete(id);
    });
  }

  Future<void> clearAllData() async {
    await _dbService.clearAllData();
  }

  // --- APP CONFIG (Password) ---

  Future<AppConfig> getAppConfig() async {
    final isar = await _dbService.db;
    final config = await isar.appConfigs.where().findFirst();
    if (config != null) return config;

    // Default Config
    final newConfig = AppConfig()..password = "123456789";
    await isar.writeTxn(() async {
      await isar.appConfigs.put(newConfig);
    });
    return newConfig;
  }

  Future<void> saveAppConfig(AppConfig config) async {
    final isar = await _dbService.db;
    await isar.writeTxn(() async {
      await isar.appConfigs.put(config);
    });
  }
}
