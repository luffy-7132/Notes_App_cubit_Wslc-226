import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../database/app_database.dart';
import '../models/notes_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  DbHelper db;
  NotesCubit({required this.db}) : super(NotesInitial());

  ///add
  void addNotes(Notes_Model notes_model) async {
    emit(NotesLoading());
    await db.addNotes(notes_model);
    var Notes = await db.fetchAllData();
    emit(NotesLoaded(arrNotes: Notes));
  }

  /// fetch
  getAllNotes() async {
    emit(NotesLoading());
    var Notes = await db.fetchAllData();
    emit(NotesLoaded(arrNotes: Notes));
  }

  ///update
  ///
  ///delete
  // deleteNotes(int id) async{
  //   emit(NotesLoading());
  //
  //
  // }
}
