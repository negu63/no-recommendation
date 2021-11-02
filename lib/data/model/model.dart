import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class History extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String url;

  @HiveField(2)
  String image;

  @HiveField(3)
  String date;

  History(this.title, this.url, this.image, this.date);
}
