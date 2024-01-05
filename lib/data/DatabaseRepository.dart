import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseRepository {
  late Database _database;

  // Methode zum Initialisieren der Datenbank.
  Future<void> initializeDatabase() async {
    // Festlegen des Pfads für die Datenbank im Verzeichnis getDatabasesPath().
    final String path = join(await getDatabasesPath(), 'user_database.db');
    
    // Öffnen der Datenbank oder Erstellen, wenn sie noch nicht existiert.
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Ausführung von SQL-Code zur Erstellung der 'users'-Tabelle.
        await db.execute(
          'CREATE TABLE users (id INTEGER PRIMARY KEY, username TEXT, email TEXT, password TEXT)',
        );
      },
    );
  }

  // Methode zum Hinzufügen eines Benutzers zur 'users'-Tabelle.
  Future<void> addUser(Map<String, dynamic> userData) async {
    await _database.insert('users', userData);
  }

  // Methode zum Abrufen eines Benutzers anhand des Benutzernamens.
  Future<Map<String, dynamic>?> getUserByUsername(String username) async {
    // Ausführen einer Abfrage auf der 'users'-Tabelle mit dem angegebenen Benutzernamen.
    List<Map<String, dynamic>> result = await _database.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
    );

    // Überprüfen, ob das Ergebnis nicht leer ist und Rückgabe des ersten Eintrags.
    if (result.isNotEmpty) {
      return result.first;
    }

    // Rückgabe von null, wenn kein Benutzer gefunden wurde.
    return null;
  }

  // Methode zum Abrufen eines Benutzers anhand der E-Mail-Adresse.
  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    // Ausführen einer Abfrage auf der 'users'-Tabelle mit der angegebenen E-Mail-Adresse.
    List<Map<String, dynamic>> result = await _database.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );

    // Überprüfen, ob das Ergebnis nicht leer ist und Rückgabe des ersten Eintrags.
    if (result.isNotEmpty) {
      return result.first;
    }

    // Rückgabe von null, wenn kein Benutzer gefunden wurde.
    return null;
  }
}
