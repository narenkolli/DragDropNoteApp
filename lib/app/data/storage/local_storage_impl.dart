import 'dart:convert';
import 'package:drag_drop_flutter/app/data/model/notes.dart';
import 'package:drag_drop_flutter/app/data/storage/local_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageImpl extends LocalStorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  Future<bool> addNote(Note note) async {
    final SharedPreferences prefs = await _prefs;
    String noteString = jsonEncode(note.toJson());
    if (kDebugMode) {
      print("Encode String text: $noteString");
    }
    return await prefs.setString('note', noteString);
  }

  @override
  Future<List<Note>?> getNotes() async {
    final SharedPreferences prefs = await _prefs;
    List<Note>? noteList = prefs
        .getStringList("noteList")
        ?.map((stringNote) => Note.fromJson(jsonDecode(stringNote)))
        .toList();
    return noteList;
  }

  @override
  Future<bool> storeNotes(List<Note> list) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> stringList =
        list.map((note) => jsonEncode(note.toJson())).toList();
    return await pref.setStringList('noteList', stringList);
  }
}
