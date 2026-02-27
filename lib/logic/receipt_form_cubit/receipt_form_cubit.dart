import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/person.dart';
import '../../data/models/receipt_history.dart';
import '../../data/models/receipt_item.dart';
import '../../data/repositories/receipt_repository.dart';
import 'package:isar/isar.dart';
import 'receipt_form_state.dart';

class ReceiptFormCubit extends Cubit<ReceiptFormState> {
  final ReceiptRepository _repo;

  ReceiptFormCubit(this._repo) : super(ReceiptFormState(
    receipt: ReceiptHistory()
      ..date = DateTime.now()
      ..items = []
      ..totalAmount = 0
  ));

  void updateDate(DateTime date) {
    var r = state.receipt;
    r.date = date;
    emit(state.copyWith(receipt: r, status: ReceiptFormStatus.editing));
  }
  
  void updateReceiptNumber(String number) {
    var r = state.receipt;
    r.receiptNumber = number;
    emit(state.copyWith(receipt: r, status: ReceiptFormStatus.editing));
  }

  void updatePayer(Person? person) {
    var r = state.receipt;
    if (person != null) {
      r.payerName = person.name;
      r.payerIdentifier = person.identifier;
    } else {
      r.payerName = null;
      r.payerIdentifier = null;
    }
    emit(state.copyWith(receipt: r, status: ReceiptFormStatus.editing));
  }
  
  // Also allow manual typing of payer name if not in list
  void updatePayerName(String name) {
     var r = state.receipt;
     r.payerName = name;
     emit(state.copyWith(receipt: r, status: ReceiptFormStatus.editing));
  }
  
  void updatePayerIdentifier(String id) {
     var r = state.receipt;
     r.payerIdentifier = id;
     emit(state.copyWith(receipt: r, status: ReceiptFormStatus.editing));
  }

  void addItem(ReceiptItem item) {
    var r = state.receipt;
    final items = r.items?.toList() ?? [];
    items.add(item);
    r.items = items;
    _recalculateTotal(r);
    emit(state.copyWith(receipt: r, status: ReceiptFormStatus.editing));
  }

  void removeItem(int index) {
    var r = state.receipt;
    final items = r.items?.toList() ?? [];
     if (index >= 0 && index < items.length) {
      items.removeAt(index);
      r.items = items;
      _recalculateTotal(r);
      emit(state.copyWith(receipt: r, status: ReceiptFormStatus.editing));
    }
  }

  void _recalculateTotal(ReceiptHistory r) {
    double total = 0;
    for (var item in r.items ?? []) {
      total += item.total;
    }
    r.totalAmount = total;
  }

  Future<void> saveReceipt(String pdfPath, String? profileName) async {
    emit(state.copyWith(status: ReceiptFormStatus.saving));
    try {
      var r = state.receipt;
      r.pdfPath = pdfPath;
      r.issuerProfileName = profileName;
      
      await _repo.saveReceipt(r);
      
      // CRITICAL: Reset ID so next save creates a NEW record instead of updating this one
      r.id = Isar.autoIncrement;

      emit(state.copyWith(status: ReceiptFormStatus.success, receipt: r));
      
      // Auto-increment for next receipt immediately
      await loadNextNumber(profileName);
      
    } catch (e) {
      emit(state.copyWith(status: ReceiptFormStatus.error, errorMessage: e.toString()));
    }
  }
  
  void resetForm() {
      emit(ReceiptFormState(
        receipt: ReceiptHistory()
          ..date = DateTime.now()
          ..items = []
          ..totalAmount = 0
      ));
  }
  
  Future<void> loadNextNumber(String? profileName) async {
    try {
      final nextInt = await _repo.getNextSequenceNumber(profileName);
      final nextStr = nextInt.toString().padLeft(6, '0'); // e.g. 000001
      updateReceiptNumber(nextStr);
    } catch (e) {
      // If error, maybe leave as is or log
      print("Error loading next number: $e");
    }
  }
}
