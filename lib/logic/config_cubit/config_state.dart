import '../../data/models/organization_config.dart';

abstract class ConfigState {}

class ConfigInitial extends ConfigState {}

class ConfigLoading extends ConfigState {}

class ConfigLoaded extends ConfigState {
  final OrganizationConfig selectedConfig;
  final List<OrganizationConfig> allConfigs;
  ConfigLoaded(this.selectedConfig, this.allConfigs);
}

class ConfigError extends ConfigState {
  final String message;
  ConfigError(this.message);
}
