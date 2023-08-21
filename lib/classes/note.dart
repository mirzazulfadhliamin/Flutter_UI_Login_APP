import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 1)
class Note {
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  DateTime createdAt;
  @HiveField(3)
  DateTime updatedAt;

  Note(this.title, this.content, this.createdAt, this.updatedAt);
}
