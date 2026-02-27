import 'package:isar/isar.dart';

part 'person.g.dart';

@collection
class Person {
  Id id = Isar.autoIncrement;

  @Index()
  late String name;

  String? identifier; // DNI, RUC, etc.
  String? address;
  String? email;
  
  @Index()
  String? listName;
}
