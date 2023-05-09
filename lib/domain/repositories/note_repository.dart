import 'package:crud_note/domain/entities/data.dart';

abstract class NoteRepository {
  Future<List<Note>> getAllNotes();
  Future<Note> getNoteById(int id);
  Future<void> createNote(Note note);
  Future<void> updateNote(Note note);
  Future<void> deleteNoteById(int id);
}
