import 'package:dartz/dartz.dart';
import 'package:drag_drop_flutter/app/data/model/notes.dart';
import 'package:drag_drop_flutter/app/data/repository/note_repository.dart';
import 'package:drag_drop_flutter/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesController extends GetxController {
  final NoteRepository repository;
  NotesController({required this.repository});

  RxList<Note> notes = RxList<Note>();
  RxBool isLoading = false.obs;

  TextEditingController titleController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getNotes();
  }

  getNotes() async {
    try {
      isLoading.value = true;
      final Either<String, List<Note>> response = await repository.getNotes();
      response.fold((error) {
        isLoading.value = false;
        notes.value = [];
      }, (list) {
        isLoading.value = false;
        notes.value = list;
      });
    } catch (e) {
      notes.value = [];
    }
  }

  updateOpenNotes(Note note) {
    print("updateOpenNotes");
    notes.firstWhere((element) => element.id == note.id).status = "OPEN";
    notes.refresh();
  }

  updateCloseNotes(Note note) {
    print("updateCloseNotes");
    notes.firstWhere((element) => element.id == note.id).status = "CLOSE";
    notes.refresh();
  }

  addNote() async {
    try {
      Note note = Note(
          title: titleController.text.toString(),
          endDate: endDateController.text.toString(),
          status: "OPEN");
      notes.add(note);

      bool isAdded = await repository.storeNotes(notes);

      if (isAdded) {
        getNotes();
        Get.back();
        Utils.showToast(
            color: Colors.green,
            message: "Note Added Successfully",
            isError: false);
      } else {
        Utils.showToast(
            color: Colors.red,
            message: "Something went wrong Please try again letter",
            isError: true);
      }
    } catch (e) {
      Utils.showToast(
          color: Colors.red,
          message: "Something went wrong Please try again letter",
          isError: true);
    }
  }
}
