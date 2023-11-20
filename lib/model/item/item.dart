import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();
final formatterHour = DateFormat.Hm();

const uuid = Uuid();

class Note {
  Note({
    required this.date,
    required this.title,
    this.description,
    this.url,
    this.pinned,
  }) : id = uuid.v4();

  final String id;
  DateTime date;
  String title;
  String? description;
  String? url;
  bool? pinned = false;

  String get formattedDate => formatter.format(date);
  String get formattedDateHour => formatter.format(date);
}
