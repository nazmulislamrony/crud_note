import '../entities/data.dart';
import '../repositories/note_repository.dart';

class GetAllNotes {
  final NoteRepository _repository;

  GetAllNotes(this._repository);

  Future<List<Note>> call() async {
    return _repository.getAllNotes();
  }
}

class GetNoteById {
  final NoteRepository _repository;

  GetNoteById(this._repository);

  Future<Note?> call(int id) async {
    return _repository.getNoteById(id);
  }
}

class CreateNote {
  final NoteRepository _repository;

  CreateNote(this._repository);

  Future<void> call(Note note) async {
    return _repository.createNote(note);
  }
}

class UpdateNote {
  final NoteRepository _repository;

  UpdateNote(this._repository);

  Future<void> call(Note note) async {
    return _repository.updateNote(note);
  }
}

class DeleteNoteById {
  final NoteRepository _repository;

  DeleteNoteById(this._repository);

  Future<void> call(int id) async {
    return _repository.deleteNoteById(id);
  }
}