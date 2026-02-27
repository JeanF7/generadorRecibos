import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/person.dart';
import '../../data/repositories/people_repository.dart';
import '../../data/services/excel_service.dart';
import 'people_list_state.dart';

class PeopleListCubit extends Cubit<PeopleListState> {
  final PeopleRepository _repo;
  final ExcelService _excelService;

  PeopleListCubit(this._repo, this._excelService) : super(PeopleListInitial());

  Future<void> loadPeople() async {
    emit(PeopleListLoading());
    try {
      final list = await _repo.getAllPeople();
      final names = await _repo.getUniqueListNames();
      emit(PeopleListLoaded(list, names));
    } catch (e) {
      emit(PeopleListError("Failed to load people: $e"));
    }
  }

  Future<void> importPeople(List<int> bytes, Map<String, int> mapping, String listName) async {
    emit(PeopleListLoading());
    try {
      final people = _excelService.parsePeople(bytes, mapping);
      // Assign listName
      for (var p in people) {
        p.listName = listName;
      }
      
      await _repo.addPeople(people);
      loadPeople(); 
    } catch (e) {
      emit(PeopleListError("Failed to import: $e"));
      loadPeople(); 
    }
  }
  
  Future<void> addPerson(Person person) async {
     try {
       await _repo.addPerson(person);
       loadPeople();
     } catch (e) {
       emit(PeopleListError("Failed to add person: $e"));
     }
  }

  Future<void> updatePerson(Person person) async {
     try {
       await _repo.addPerson(person);
       loadPeople();
     } catch (e) {
       emit(PeopleListError("Failed to update person: $e"));
     }
  }

  Future<void> deletePerson(int id) async {
    try {
      await _repo.deletePerson(id);
      loadPeople();
    } catch (e) {
       emit(PeopleListError("Failed to delete person: $e"));
    }
  }

  Future<void> deleteList(String listName) async {
    try {
      await _repo.deletePeopleByList(listName);
      loadPeople();
    } catch (e) {
      emit(PeopleListError("Failed to delete list: $e"));
    }
  }
}
