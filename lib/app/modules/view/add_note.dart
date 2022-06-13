import 'package:drag_drop_flutter/app/modules/controller/notes_controller.dart';
import 'package:drag_drop_flutter/app/utils/validators.dart';
import 'package:drag_drop_flutter/app/widget/custom_text.dart';
import 'package:drag_drop_flutter/app/widget/custom_text_field_widget.dart';
import 'package:drag_drop_flutter/app/widget/outline_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const CustomText(
        text: "Add Note",
        fontWeight: CustomFontWeight.Black,
        size: 16,
      )),
      body: GetBuilder<NotesController>(builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              CustomTextFieldWidget(
                controller: _.titleController,
                labelText: "Enter Title",
                hintText: "Enter Title",
                addHint: true,
                validator: Validators.validateEmpty,
              ),
              const SizedBox(height: 16),
              CustomTextFieldWidget(
                controller: _.endDateController,
                labelText: "Enter End Date",
                hintText: "Enter End Date",
                addHint: true,
                validator: Validators.validateEmpty,
              ),
              const SizedBox(height: 16),
              CustomOutlineButton(
                textColor: Colors.blueAccent,
                text: "SAVE",
                letterSpacing: 1.4,
                buttonWidth: Get.width,
                onTap: () {
                  _.addNote();
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
