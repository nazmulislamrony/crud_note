import 'package:crud_note/data/datasources/local_database.dart';
import 'package:crud_note/domain/entities/data.dart';
import 'package:crud_note/domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final LocalDatabase _database;

  NoteRepositoryImpl(this._database);

  @override
  Future<void> createNote(Note note) async {
    final db = await _database.db;
    await db.insert('notes', note.toJson());
  }

  @override
  Future<void> deleteNoteById(int id) async {
    final db = await _database.db;
    await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<List<Note>> getAllNotes() async {
    final db = await _database.db;
    final notes = await db.query('notes');
    return notes.map((json) => Note.fromJson(json)).toList();
  }

  @override
  Future<Note> getNoteById(int id) async {
    final db = await _database.db;
    final note = await db.query('notes', where: 'id=?', whereArgs: [id]);
    return note.isNotEmpty
        ? Note.fromJson(note.first)
        : Note(id: -1, title: "", content: "");
  }

  @override
  Future<void> updateNote(Note note) async {
    final db = await _database.db;
    await db
        .update('notes', note.toJson(), where: 'id = ?', whereArgs: [note.id]);
  }
}
