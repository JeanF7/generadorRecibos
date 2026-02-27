import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../models/organization_config.dart';
import '../models/person.dart';
import '../models/receipt_history.dart';
import '../models/app_config.dart';
import '../models/receipt_item.dart';

class DatabaseService {
  late Future<Isar> db;

  DatabaseService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      // Use executable folder for portability
      final dir = File(Platform.resolvedExecutable).parent;
      return await Isar.open(
        [OrganizationConfigSchema, PersonSchema, ReceiptHistorySchema, AppConfigSchema],
        directory: dir.path,
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }
  Future<void> clearAllData() async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.clear();
    });
  }
}
