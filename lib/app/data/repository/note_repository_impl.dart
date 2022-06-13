import 'package:dartz/dartz.dart';
import 'package:drag_drop_flutter/app/data/model/notes.dart';
import 'package:drag_drop_flutter/app/data/repository/note_repository.dart';
import 'package:drag_drop_flutter/app/data/storage/local_storage.dart';

class NoteRepositoryImpl extends NoteRepository {
  final LocalStorage localStorage;
  NoteRepositoryImpl({required this.localStorage});

  @override
  Future<Either<String, List<Note>>> getNotes() async {
    try {
      List<Note> notes = await localStorage.getNotes() ?? [];
      return right(notes);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> addNote({Note? note}) async {
    try {
      bool status = await localStorage.addNote(note!);
      return right(status);
    } catch (e) {
      return left("Something went wrong.");
    }
  }

  @override
  Future<bool> storeNotes(List<Note> list) async {
    return await localStorage.storeNotes(list) ?? false;
  }
}
