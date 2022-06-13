import 'package:dartz/dartz.dart';
import 'package:drag_drop_flutter/app/data/model/notes.dart';

abstract class NoteRepository {
  Future<Either<String, bool>> addNote({Note note});
  Future<Either<String, List<Note>>> getNotes();
  Future<bool> storeNotes(List<Note> list);
}
