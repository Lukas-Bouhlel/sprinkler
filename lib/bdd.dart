import 'package:path/path.dart'; // Pour la fonction join
import 'package:sqflite/sqflite.dart'; // Pour la fonction getDatabasesPath

// Get a location using getDatabasesPath
void getDatabasePath() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'demo.db');

  // Delete the database
  await deleteDatabase(path);

  // open the database
  Database database = await openDatabase(path, version: 1,
    onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
        'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    }
  );

  // Insert some records in a transaction
  await database.transaction((txn) async {
    int id1 = await txn.rawInsert(
        'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
    print('inserted1: $id1');
    int id2 = await txn.rawInsert(
        'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
        ['another name', 12345678, 3.1416]);
    print('inserted2: $id2');
  });

  
}