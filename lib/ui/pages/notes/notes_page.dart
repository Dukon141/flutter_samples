import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_samples/helpers/alert_helper.dart';
import 'package:flutter_samples/ui/pages/notes/bloc/notes_bloc.dart';
import 'package:flutter_samples/ui/pages/notes/widgets/note_item.dart';

import '../../widgets/custom_cupertino_text_field.dart';
import '../../widgets/custom_sliver.dart';
import 'models/note.dart';

class NotesPage extends StatelessWidget {
  NotesPage({super.key});

  final titleController = TextEditingController();
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return BlocProvider(
      create: (context) => NotesBloc()..add(GetNotes()),
      child: Builder(
        builder: (context) {
          return SafeArea(
            child: Scaffold(
              body: BlocConsumer<NotesBloc, NotesState>(
                listener: (context, state) {
                  if (state.showMessage) {
                    AlertHelper().showSnackBar(
                      context: context,
                      message: state.snackBarMessage!,
                    );
                  }
                },
                builder: (context, state) {
                  /// Loading state
                  if (state.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  /// Other states
                  final notes = state.notes;

                  return CustomSliver(
                    title: 'Notes list',
                    itemBuilder: (context, index) {
                      if (state.emptyList) {
                        return _EmptyList();
                      } else {
                        final note = notes![index];
                        return _Note(note: note);
                      }
                    },
                    itemCount: state.emptyList ? 1 : state.notes!.length,
                  );
                },
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => _showWriteNoteAlert(context: context),
                child: Icon(Icons.add, color: primaryColor),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showWriteNoteAlert({required BuildContext context}) {
    AlertHelper().showAlert(
      context: context,
      title: 'New note',
      child: Column(
        children: [
          CustomCupertinoTextField(
            controller: titleController,
            hintText: 'Title',
            maxLines: 1,
          ),
          CustomCupertinoTextField(
            controller: textController,
            hintText: 'Content',
          ),
        ],
      ),
      onAccept: () async {
        final note = Note(
          title: titleController.text.trim(),
          text: textController.text.trim(),
        );

        BlocProvider.of<NotesBloc>(context).add(InsertNote(note: note));

        titleController.clear();
        textController.clear();
      },
    );
  }
}

class _EmptyList extends StatelessWidget {
  const _EmptyList();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Empty list'));
  }
}

class _Note extends StatelessWidget {
  const _Note({required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Dismissible(
      key: Key(note.id.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) async {
        BlocProvider.of<NotesBloc>(context).add(DeleteNote(note: note));
      },
      background: Container(
        color: primaryColor,
        alignment: Alignment.centerRight,
        child: Icon(Icons.delete, color: Colors.white),
      ),
      child: NoteItem(title: note.title, text: note.text),
    );
  }
}
