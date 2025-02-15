import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_samples/models/status.dart';
import 'package:flutter_samples/ui/pages/notes/models/note.dart';

import '../../../../repository/data_base_repository.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final DataBaseRepository dataBaseRepository = DataBaseRepository(
    databaseName: 'notes',
  );

  NotesBloc() : super(NotesState()) {
    on<GetNotes>((event, emit) async => await _getNotes(event, emit));
    on<InsertNote>((event, emit) async => await _insertNote(event, emit));
    on<DeleteNote>((event, emit) async => await _deleteNote(event, emit));
  }

  Future<void> _getNotes(GetNotes event, Emitter<NotesState> emit) async {
    final notes = await dataBaseRepository.getNotes();
    emit(state.copyWith(status: Status.success, notes: notes));
  }

  Future<void> _insertNote(InsertNote event, Emitter<NotesState> emit) async {
    await dataBaseRepository.insertNote(note: event.note);
    emit(state.copyWith(snackBarMessage: 'Note added'));
    add(GetNotes());
  }

  Future<void> _deleteNote(DeleteNote event, Emitter<NotesState> emit) async {
    await dataBaseRepository.deleteNote(note: event.note);
    emit(state.copyWith(snackBarMessage: 'Note deleted'));
    add(GetNotes());
  }
}
