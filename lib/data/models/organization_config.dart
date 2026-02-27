import 'package:isar/isar.dart';

part 'organization_config.g.dart';

@collection
class OrganizationConfig {
  Id id = Isar.autoIncrement;

  String? profileName; // Default "Default"
  String? name;
  String? address;
  String? taxId;
  String? logoPath;
  String? signaturePath;
  String? stampPath;
  String? email;
  String? phone;
  String? additionalInfo;
  bool? isInstitution;
}
