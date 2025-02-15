class Note {
  final int? id;
  final String title;
  final String text;

  Note({this.id, required this.title, required this.text});

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(id: map['id'], title: map['title'], text: map['text']);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'text': text};
  }
}
