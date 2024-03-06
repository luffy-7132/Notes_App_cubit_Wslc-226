import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubit/notes_cubit.dart';
import 'package:untitled/models/notes_model.dart';

import '../custom_widgets/custom_widgets.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Notes'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomWidgets.customTextField(controller: titleController),
            SizedBox(
              height: 50,
            ),
            CustomWidgets.customTextField(
                controller: descController, text: 'Desc'),
            SizedBox(
              height: 50,
            ),
            CustomWidgets.customElevatedButton('Add', () {
              if (titleController.text != "" && descController.text != "") {
                context.read<NotesCubit>().addNotes(Notes_Model(
                    title: titleController.text, desc: descController.text));
                context.read<NotesCubit>().getAllNotes();
                Navigator.pop(context);
              } else {
                log('Please fill all the fields');
              }
            })
          ],
        ),
      ),
    );
  }
}
