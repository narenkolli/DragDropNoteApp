import 'package:drag_drop_flutter/app/data/model/notes.dart';
import 'package:drag_drop_flutter/app/modules/view/note_item.dart';
import 'package:flutter/material.dart';

class DragNoteItem extends StatelessWidget {
  final Note note;
  const DragNoteItem({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable<Note>(
      key: Key("Key${note.id}"),
      data: note,
      feedback: NoteItem(
        note: note,
      ),
      child: NoteItem(
        note: note,
      ),
    );
  }
}
