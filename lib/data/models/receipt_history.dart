import 'package:isar/isar.dart';
import 'receipt_item.dart';

part 'receipt_history.g.dart';

@collection
class ReceiptHistory {
  Id id = Isar.autoIncrement;

  @Index()
  late DateTime date;

  String? receiptNumber;
  String? payerName;
  String? payerIdentifier;
  
  double? totalAmount;
  
  List<ReceiptItem>? items;

  String? pdfPath;
  
  @Index()
  String? issuerProfileName;
}
