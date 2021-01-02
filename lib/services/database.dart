import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_my_bakery/models/models.dart';

class NotesDatabaseService {
  String path;

  NotesDatabaseService._();

  static final NotesDatabaseService db = NotesDatabaseService._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await init();
    return _database;
  }

  init() async {
    String path = await getDatabasesPath();
    path = join(path, 'main.db');
    print("Entered path $path");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Notes (_id INTEGER PRIMARY KEY, title TEXT, content TEXT, date TEXT, isImportant INTEGER);');
      print('New table created at $path');

      await db.execute(
          'CREATE TABLE Expenses (_id INTEGER PRIMARY KEY, title TEXT, content TEXT, date TEXT);');
      print('New table created at $path');

      await db.execute(
          'CREATE TABLE Ekmek (_id INTEGER PRIMARY KEY, amount TEXT, time TEXT);');
      print('New table created at $path');

      await db.execute(
          'CREATE TABLE Veresiye (_id INTEGER PRIMARY KEY, title TEXT, content TEXT, date TEXT);');
      print('New table created at $path');
    });
  }

  Future<List<NotesModel>> getNotesFromDB() async {
    final db = await database;
    List<NotesModel> notesList = [];
    List<Map> maps = await db.query('Notes',
        columns: ['_id', 'title', 'content', 'date', 'isImportant']);
    print(maps.length);
    if (maps.length > 0) {
      maps.forEach((map) {
        notesList.add(NotesModel.fromMap(map));
      });
    }
    return notesList;
  }

  Future<List<ExpensesModel>> getExpensesFromDB() async {
    final db = await database;
    List<ExpensesModel> expensesList = [];
    List<Map> maps = await db
        .query('Expenses', columns: ['_id', 'title', 'content', 'date']);
    print("expense data: " + maps.toString());
    if (maps.length > 0) {
      maps.forEach((map) {
        expensesList.add(ExpensesModel.fromMap(map));
      });
    }
    return expensesList;
  }

  Future<List<EkmekModel>> getEkmekFromDB() async {
    final db = await database;
    List<EkmekModel> ekmekList = [];
    List<Map> maps =
        await db.query('Ekmek', columns: ['_id', 'amount', 'time']);
    print("ekmek data: " + maps.toString());
    if (maps.length > 0) {
      maps.forEach((map) {
        ekmekList.add(EkmekModel.fromMap(map));
      });
    }
    return ekmekList;
  }

  Future<List<VeresiyeModel>> getVeresiyeFromDB() async {
    final db = await database;
    List<VeresiyeModel> veresiyeList = [];
    List<Map> maps = await db.query('Veresiye',
        columns: ['_id', 'title', 'content', 'date']);
    print(maps.length);
    if (maps.length > 0) {
      maps.forEach((map) {
        veresiyeList.add(VeresiyeModel.fromMap(map));
      });
    }
    return veresiyeList;
  }


  updateNoteInDB(NotesModel updatedNote) async {
    final db = await database;
    await db.update('Notes', updatedNote.toMap(),
        where: '_id = ?', whereArgs: [updatedNote.id]);
    print('Note updated: ${updatedNote.title} ${updatedNote.content}');
  }

  updateExpenseInDB(ExpensesModel updatedExpense) async {
    final db = await database;
    await db.update('Expenses', updatedExpense.toMap(),
        where: '_id = ?', whereArgs: [updatedExpense.id]);
    print('Note updated: ${updatedExpense.title} ${updatedExpense.content}');
  }

  updateEkmekInDB(EkmekModel updatedEkmek) async {
    final db = await database;
    await db.update('Ekmek', updatedEkmek.toMap(),
        where: '_id = ?', whereArgs: [updatedEkmek.id]);
    print('Note updated: ${updatedEkmek.amount} ${updatedEkmek.time}');
  }

  updateVeresiyeInDB(VeresiyeModel updatedVeresiye) async {
    final db = await database;
    await db.update('Veresiye', updatedVeresiye.toMap(),
        where: '_id = ?', whereArgs: [updatedVeresiye.id]);
    print('Veresiye updated: ${updatedVeresiye.title} ${updatedVeresiye.content}');
  }

  deleteNoteInDB(NotesModel noteToDelete) async {
    final db = await database;
    await db.delete('Notes', where: '_id = ?', whereArgs: [noteToDelete.id]);
    print('Note deleted');
  }

  deleteExpenseInDB(ExpensesModel expenseToDelete) async {
    final db = await database;
    await db
        .delete('Expenses', where: '_id = ?', whereArgs: [expenseToDelete.id]);
    print('Expense deleted');
  }

  deleteEkmekInDB(EkmekModel ekmekToDelete) async {
    final db = await database;
    await db.delete('Ekmek', where: '_id = ?', whereArgs: [ekmekToDelete.id]);
    print('Ekmek deleted');
  }

  deleteVeresiyeInDB(VeresiyeModel veresiyeToDelete) async {
    final db = await database;
    await db.delete('Veresiye', where: '_id = ?', whereArgs: [veresiyeToDelete.id]);
    print('Veresiye deleted');
  }

  Future<NotesModel> addNoteInDB(NotesModel newNote) async {
    final db = await database;
    if (newNote.title.trim().isEmpty) newNote.title = 'Untitled Note';
    String id = await db.transaction((transaction) {
      transaction.rawInsert(
          'INSERT into Notes(title, content, date, isImportant) VALUES ("${newNote.title}", "${newNote.content}", "${newNote.date.toIso8601String()}", ${newNote.isImportant == true ? 1 : 0});');
    });
    newNote.id = id;
    print('Note added: ${newNote.title} ${newNote.content}');
    return newNote;
  }

  Future<ExpensesModel> addExpenseInDB(ExpensesModel newExpense) async {
    final db = await database;
    if (newExpense.title.trim().isEmpty) newExpense.title = 'Untitled Expense';

    String id = await db.transaction((transaction) {
      transaction.rawInsert(
          'INSERT into Expenses(title, content, date) VALUES ("${newExpense.title + " ₺"}", "${newExpense.content}", "${newExpense.date.toIso8601String()}");');
    });

    List<Map> maps = await db
        .query('Expenses', columns: ['_id', 'title', 'content', 'date']);
    print("after insert: " + maps.toString());

    newExpense.id = id;
    print('Expense added: ${newExpense.title} ${newExpense.content}');
    return newExpense;
  }

  Future<EkmekModel> addEkmekInDB(EkmekModel newEkmek) async {
    final db = await database;
    if (newEkmek.amount.trim().isEmpty) newEkmek.time = 'Untitled Expense';

    String id = await db.transaction((transaction) {
      transaction.rawInsert(
          'INSERT into Ekmek(amount, time) VALUES ("${newEkmek.amount + " Ekmek"}", "${newEkmek.time}");');
    });

    List<Map> maps =
        await db.query('Ekmek', columns: ['_id', 'amount', 'time']);
    print("after insert: " + maps.toString());

    newEkmek.id = id;
    print('Ekmek added: ${newEkmek.amount} ${newEkmek.time}');
    return newEkmek;
  }

  Future<VeresiyeModel> addVeresiyeInDB(VeresiyeModel newVeresiye) async {
    final db = await database;
    if (newVeresiye.title.trim().isEmpty) newVeresiye.title = 'Anonim';
    int id = await db.transaction((transaction) {
      transaction.rawInsert(
          'INSERT into Veresiye(title, content, date) VALUES ("${newVeresiye.title}", "${newVeresiye.content} ₺", "${newVeresiye.date.toIso8601String()}");');
    });
    newVeresiye.id = id;
    print('Veresiye added: ${newVeresiye.title} ${newVeresiye.content}');
    return newVeresiye;
  }


}
