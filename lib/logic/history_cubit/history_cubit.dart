import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/receipt_repository.dart';
import 'package:open_filex/open_filex.dart';
import 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final ReceiptRepository _repo;

  HistoryCubit(this._repo) : super(HistoryInitial());

  Future<void> loadHistory() async {
    emit(HistoryLoading());
    try {
      final history = await _repo.getHistory();
      emit(HistoryLoaded(history));
    } catch (e) {
      emit(HistoryError("Error al cargar historial: $e"));
    }
  }
  
  Future<void> openReceiptPdf(String? path) async {
     if (path == null || path.isEmpty) return;
     try {
       await OpenFilex.open(path);
     } catch (e) {
       // Just catching to prevent crash, UI might not show error toast here easily without listener
     }
  }
}
