part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesLoading extends NotesState {}

class NotesLoaded extends NotesState {
  List<Notes_Model>? arrNotes;
  int? id;
  NotesLoaded({this.arrNotes, this.id});
}

class NotesError extends NotesState {
  String error;
  NotesError({required this.error});
}
