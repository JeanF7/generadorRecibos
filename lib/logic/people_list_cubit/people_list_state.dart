import '../../data/models/person.dart';

abstract class PeopleListState {}

class PeopleListInitial extends PeopleListState {}
class PeopleListLoading extends PeopleListState {}
class PeopleListLoaded extends PeopleListState {
  final List<Person> allPeople;
  final List<String> listNames;
  
  PeopleListLoaded(this.allPeople, this.listNames);
  
  // Helper to get grouped view
  Map<String, List<Person>> get grouped {
     Map<String, List<Person>> map = {};
     for (var name in listNames) {
       map[name] = allPeople.where((p) => p.listName == name).toList();
     }
     // Items without listName?
     final others = allPeople.where((p) => p.listName == null || p.listName!.isEmpty).toList();
     if (others.isNotEmpty) map['Otros'] = others;
     
     return map;
  }
}
class PeopleListError extends PeopleListState {
  final String message;
  PeopleListError(this.message);
}
