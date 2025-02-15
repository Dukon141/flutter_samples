part of 'notes_bloc.dart';

final class NotesState {
  final Status status;
  final String? snackBarMessage;
  final List<Note>? notes;

  NotesState({this.status = Status.loading, this.snackBarMessage, this.notes});

  NotesState copyWith({
    Status? status,
    String? snackBarMessage,
    List<Note>? notes,
  }) => NotesState(
    status: status ?? this.status,
    snackBarMessage: snackBarMessage,
    notes: notes ?? this.notes,
  );
}

extension NoteStateX on NotesState {
  bool get isLoading => status == Status.loading;

  bool get emptyList => status == Status.success && notes?.isEmpty == true;

  bool get success => status == Status.success && notes?.isNotEmpty == true;

  bool get showMessage => snackBarMessage?.isNotEmpty == true;
}
