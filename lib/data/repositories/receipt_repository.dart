import 'package:isar/isar.dart';
import '../local/database_service.dart';
import '../models/receipt_history.dart';

class ReceiptRepository {
  final DatabaseService _dbService;

  ReceiptRepository(this._dbService);

  Future<List<ReceiptHistory>> getHistory() async {
    final isar = await _dbService.db;
    // Sort by date descending
    return await isar.receiptHistorys.where().sortByDateDesc().findAll();
  }

  Future<void> saveReceipt(ReceiptHistory receipt) async {
    final isar = await _dbService.db;
    await isar.writeTxn(() async {
      await isar.receiptHistorys.put(receipt);
    });
  }

  Future<int> getNextSequenceNumber(String? profileName) async {
    final isar = await _dbService.db;
    
    // Fetch all receipt numbers for this profile
    // Note: We fetch objects to parse the String receiptNumber manually
    final receipts = await isar.receiptHistorys
        .filter()
        .issuerProfileNameEqualTo(profileName)
        .findAll();

    if (receipts.isEmpty) {
      return 1;
    }

    int maxNum = 0;
    for (var r in receipts) {
      if (r.receiptNumber != null) {
        final parsed = int.tryParse(r.receiptNumber!);
        if (parsed != null && parsed > maxNum) {
          maxNum = parsed;
        }
      }
    }
    
    return maxNum + 1;
  }
}
