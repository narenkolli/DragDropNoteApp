import 'package:drag_drop_flutter/app/data/repository/note_repository.dart';
import 'package:drag_drop_flutter/app/data/repository/note_repository_impl.dart';
import 'package:drag_drop_flutter/app/data/storage/local_storage.dart';
import 'package:drag_drop_flutter/app/modules/controller/notes_controller.dart';
import 'package:get/get.dart';

class NoteBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<NoteRepository>(
        NoteRepositoryImpl(localStorage: Get.find<LocalStorage>()));
    Get.put<NotesController>(
        NotesController(repository: Get.find<NoteRepository>()));
  }
}
