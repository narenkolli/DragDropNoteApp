import 'package:drag_drop_flutter/app/data/model/notes.dart';
import 'package:drag_drop_flutter/app/modules/controller/notes_controller.dart';
import 'package:drag_drop_flutter/app/modules/view/drag_note_item.dart';
import 'package:drag_drop_flutter/app/routes/routes_name.dart';
import 'package:drag_drop_flutter/app/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_PAGE);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
          title: const CustomText(
        text: "Note App",
        fontWeight: CustomFontWeight.Black,
        size: 16,
      )),
      body: GetX<NotesController>(builder: (_) {
        List<Note> notesOpen = [];
        List<Note> notesClose = [];
        for (Note note in _.notes) {
          if (note.status!.compareTo("OPEN") == 0) {
            notesOpen.add(note);
          } else {
            notesClose.add(note);
          }
        }
        print("notesOpen ${notesOpen.length}");
        print("notesClose ${notesClose.length}");
        print("GetX");
        return _.isLoading.value
            ? const Center(child: CupertinoActivityIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    const CustomText(
                      text: "Open Task",
                      fontWeight: CustomFontWeight.Black,
                      size: 16,
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Stack(
                        children: [
                          DragTarget<Note>(
                            builder: (context, candidate, reject) {
                              return notesOpen.isNotEmpty
                                  ? ListView.builder(
                                      itemCount: notesOpen.length,
                                      shrinkWrap: true,
                                      primary: false,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        Note note = notesOpen[index];
                                        return DragNoteItem(note: note);
                                      })
                                  : const Center(
                                      child:
                                          CustomText(text: "No Record found"));
                            },
                            onWillAccept: (value) => !notesOpen
                                .any((element) => element.id == value!.id),
                            onAccept: (Note note) {
                              _.updateOpenNotes(note);
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const CustomText(
                      text: "Close Task",
                      fontWeight: CustomFontWeight.Black,
                      size: 16,
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                        child: Stack(
                      children: [
                        DragTarget<Note>(
                          builder: (context, candidate, reject) {
                            return notesClose.isNotEmpty
                                ? ListView.builder(
                                    itemCount: notesClose.length,
                                    shrinkWrap: true,
                                    primary: false,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      Note note = notesClose[index];
                                      return DragNoteItem(note: note);
                                    })
                                : const Center(
                                    child: CustomText(text: "No Record found"));
                          },
                          onWillAccept: (value) => !notesClose
                              .any((element) => element.id == value!.id),
                          onAccept: (Note note) {
                            _.updateCloseNotes(note);
                          },
                        ),
                      ],
                    )),
                  ],
                ),
              );
      }),
    );
  }
}
