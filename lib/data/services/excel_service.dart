import 'dart:io';
import 'package:excel/excel.dart';
import '../models/person.dart';

class ExcelService {
  
  /// Returns the headers of the first sheet
  List<String> getHeaders(List<int> bytes) {
    var excel = Excel.decodeBytes(bytes);
    if (excel.tables.isEmpty) return [];
    
    final table = excel.tables.values.first;
    if (table.rows.isEmpty) return [];
    
    return table.rows.first.map((e) => e?.value.toString() ?? "").toList();
  }

  /// Parses the excel file based on the column mapping
  /// mapping: { 'name': colIndex, 'identifier': colIndex, ... }
  List<Person> parsePeople(List<int> bytes, Map<String, int> mapping) {
    var excel = Excel.decodeBytes(bytes);
    if (excel.tables.isEmpty) return [];
    
    final table = excel.tables.values.first;
    List<Person> people = [];

    // Skip header row
    for (int i = 1; i < table.rows.length; i++) {
      final row = table.rows[i];
      final person = Person();
      
      if (mapping.containsKey('name') && mapping['name']! < row.length) {
        person.name = row[mapping['name']!]?.value.toString() ?? "Unknown";
      } else {
        person.name = "Unknown"; // Name is required
      }

      if (mapping.containsKey('identifier') && mapping['identifier']! < row.length) {
        person.identifier = row[mapping['identifier']!]?.value.toString();
      }

      if (mapping.containsKey('address') && mapping['address']! < row.length) {
         person.address = row[mapping['address']!]?.value.toString();
      }
      
      if (mapping.containsKey('email') && mapping['email']! < row.length) {
         person.email = row[mapping['email']!]?.value.toString();
      }
      


      if (person.name != "Unknown") {
        people.add(person);
      }
    }
    
    return people;
  }
}
