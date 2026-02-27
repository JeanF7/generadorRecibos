import 'package:isar/isar.dart';
import '../local/database_service.dart';
import '../models/person.dart';

class PeopleRepository {
  final DatabaseService _dbService;

  PeopleRepository(this._dbService);

  // Get all unique list names
  Future<List<String>> getUniqueListNames() async {
    final isar = await _dbService.db;
    
    // Isar doesn't have "DISTINCT" in query easily for properties, 
    // but we can query all and map. For large DBs this isn't optimal, 
    // but for < 10k items it's fine.
    // Alternatively, use a separate collection for "Lists". 
    // Given the request, "Lists" are just a property.
    
    // Optimization: Use property query
    final allNames = await isar.persons.where().listNameProperty().findAll();
    return allNames.whereType<String>().toSet().toList(); // Unique non-null
  }

  Future<List<Person>> getPeopleByList(String listName) async {
    final isar = await _dbService.db;
    return await isar.persons.filter().listNameEqualTo(listName).findAll();
  }

  Future<List<Person>> getAllPeople() async {
    final isar = await _dbService.db;
    return await isar.persons.where().findAll();
  }
  
  Future<List<Person>> searchPeople(String query, {String? listName}) async {
     final isar = await _dbService.db;
     var q = isar.persons.filter()
       .nameContains(query, caseSensitive: false)
       .or()
       .identifierContains(query);
       
     if (listName != null) {
       // Isar dynamic filters are a bit more complex to chain effectively with ORs above.
       // Easiest is to filter everything then memory filter, or build composite.
       // Let's rely on memory filtering for search within a specific list if simple query fails.
       // Or better:
       return await isar.persons.filter()
         .group((g) => g
             .nameContains(query, caseSensitive: false)
             .or()
             .identifierContains(query)
         )
         .and()
         .listNameEqualTo(listName)
         .findAll();
     }
     
     return await q.findAll();
  }

  Future<void> addPerson(Person person) async {
    final isar = await _dbService.db;
    await isar.writeTxn(() async {
      await isar.persons.put(person);
    });
  }
  
   Future<void> addPeople(List<Person> people) async {
    final isar = await _dbService.db;
    await isar.writeTxn(() async {
      await isar.persons.putAll(people);
    });
  }

  Future<void> deletePerson(int id) async {
    final isar = await _dbService.db;
    await isar.writeTxn(() async {
      await isar.persons.delete(id);
    });
  }

  Future<void> deletePeopleByList(String listName) async {
    final isar = await _dbService.db;
    // Find IDs first to ensure correct targeting
    List<Person> peopleToDelete;
    
    if (listName == 'Otros') {
      // Special case: Delete items with no list name or explicit "Otros"
      peopleToDelete = await isar.persons.filter()
        .listNameIsNull()
        .or()
        .listNameIsEmpty()
        .or()
        .listNameEqualTo('Otros')
        .findAll();
    } else {
      peopleToDelete = await isar.persons.filter().listNameEqualTo(listName).findAll();
    }

    final ids = peopleToDelete.map((e) => e.id).toList();
    
    if (ids.isNotEmpty) {
      await isar.writeTxn(() async {
        await isar.persons.deleteAll(ids);
      });
    }
  }
}
