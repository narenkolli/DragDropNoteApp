import 'package:drag_drop_flutter/app/data/model/notes.dart';

abstract class LocalStorage {
  Future<bool> addNote(Note note);
  Future<bool?> storeNotes(List<Note> list);
  Future<List<Note>?> getNotes();
}
