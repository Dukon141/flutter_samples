part of 'notes_bloc.dart';

@immutable
sealed class NotesEvent {}

class GetNotes extends NotesEvent {}

class InsertNote extends NotesEvent {
  final Note note;

  InsertNote({required this.note});
}

class UpdateNote extends NotesEvent {
  final Note note;

  UpdateNote({required this.note});
}

class DeleteNote extends NotesEvent {
  final Note note;

  DeleteNote({required this.note});
}
