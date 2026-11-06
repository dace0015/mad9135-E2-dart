import 'dart:convert';

import 'package:e2_dart/students.dart';
import 'package:uuid/uuid.dart';

void main(List<String> arguments) {
  String json = '''
[
  {"id": "84766fdf-9dc8-4b27-953f-a0756d48a2ba", "first": "Garrus", "last": "Vakarian", "email": "gvakarian@normandy.com"},
  {"id": "ef18a663-721c-4905-8220-7d8458ddc644", "first": "Tali", "last": "Zorah", "email": "tzorah@normandy.com"},
  {"id": "2bd58d29-e4ce-443d-ac50-49bea0c7d968", "first": "Liara", "last": "TSoni", "email": "ltsoni@normandy.com"},
  {"id": "90e8d858-284b-4d04-80ec-cae6e026ba88", "first": "Ashley", "last": "Williams", "email": "awilliams@normandy.com"},
  {"id": "5d24138e-13e9-419e-9505-8b841d157bc6", "first": "Miranda", "last": "Lawson", "email": "mlawson@normandy.com"},
  {"id": "72610b4e-7160-481d-86bc-a07b1c559f5f", "first": "Jack", "last": "Harper", "email": "jharper@normandy.com"}
]
''';

  List<dynamic> massEffectDecoded = jsonDecode(json);

  List<Map<String, String>> massEffectFormatted = massEffectDecoded.map((student) {
    return Map<String, String>.from(student);
  }).toList();

  Students massEffectStudents = Students(massEffectFormatted);

  print('');
  print(
    'Initial output of the Mass Effect json that has been decoded with dart:convert and reformatted in the students.dart class',
  );

  print('*' * 25);
  massEffectStudents.output();
  print('*' * 25);
  print('');

  var uuid = Uuid();

  Map<String, String> wrexUrdnot = {
    'id': uuid.v4(),
    'first': 'Wrex',
    'last': 'Urdnot',
    'email': 'wurdnot@normandy.com',
  };

  Map<String, String> mordinSolus = {
    'id': uuid.v4(),
    'first': 'Mordin',
    'last': 'Solus',
    'email': 'msolus@normandy.com',
  };

  massEffectStudents.plus(wrexUrdnot);

  print('Adding ${wrexUrdnot['first']} ${wrexUrdnot['last']}, one of my favorite characters in Mass Effect.');
  print('*' * 25);
  massEffectStudents.output();
  print('*' * 25);
  print('');

  massEffectStudents.remove('first', 'Jack');

  print('Removing entries where first == Jack.');
  print('*' * 25);
  massEffectStudents.output();
  print('*' * 25);
  print('');

  massEffectStudents.sort('last');

  print('Sorting entries by last names.');
  print('*' * 25);
  massEffectStudents.output();
  print('*' * 25);
  print('');

  massEffectStudents.plus(mordinSolus);
  massEffectStudents.remove('last', 'Williams');
  massEffectStudents.sort('email');

  print('Adding ${mordinSolus['first']} ${mordinSolus['last']}, the very model of a scientist Salarian!');
  print('Removing entries where last == Williams, because Ashley is a Xenophobe in a game full of alien shipmates.');
  print('Sorting entries by email.');
  print('*' * 25);
  massEffectStudents.output();
  print('*' * 25);
  print('');
}
