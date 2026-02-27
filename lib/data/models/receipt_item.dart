import 'package:isar/isar.dart';

part 'receipt_item.g.dart';

@embedded
class ReceiptItem {
  String? description;
  double? quantity;
  double? unitPrice;
  
  double get total => (quantity ?? 0) * (unitPrice ?? 0);
}
