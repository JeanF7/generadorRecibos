import '../../data/models/receipt_history.dart';

enum ReceiptFormStatus { editing, saving, success, error }

class ReceiptFormState {
  final ReceiptHistory receipt;
  final ReceiptFormStatus status;
  final String? errorMessage;

  ReceiptFormState({
    required this.receipt,
    this.status = ReceiptFormStatus.editing,
    this.errorMessage,
  });

  ReceiptFormState copyWith({
    ReceiptHistory? receipt,
    ReceiptFormStatus? status,
    String? errorMessage,
  }) {
    return ReceiptFormState(
      receipt: receipt ?? this.receipt,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
