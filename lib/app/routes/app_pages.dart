import 'package:drag_drop_flutter/app/modules/view/add_note.dart';
import 'package:drag_drop_flutter/app/modules/bindings/notes_bindings.dart';
import 'package:drag_drop_flutter/app/modules/view/notes_list.dart';
import 'package:drag_drop_flutter/app/routes/routes_name.dart';
import 'package:get/get.dart';

class AppPages {
  const AppPages._();

  static final routes = [
    GetPage(
        name: Routes.INITIAL_PAGE,
        page: () => const NotesPage(),
        binding: NoteBindings()),
    GetPage(
        name: Routes.ADD_PAGE,
        page: () => const AddNote(),
        binding: NoteBindings()),
  ];
}
