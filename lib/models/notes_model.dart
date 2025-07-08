import 'package:hive/hive.dart';

part 'notes_model.g.dart';

@HiveType(typeId: 0)
class NotesModel extends HiveObject {
  @HiveField(0)
   String title;
  @HiveField(1)
   String subTitle;
  @HiveField(2)
   String noteDate;
  @HiveField(3)
   int color;

  NotesModel({
    required this.title,
    required this.subTitle,
    required this.noteDate,
    required this.color,
  });
}
