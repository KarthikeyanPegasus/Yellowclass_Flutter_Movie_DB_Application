import 'package:hive/hive.dart';

part 'Moviemodel.g.dart';

@HiveType(typeId: 0)
class Moviemodel {
  @HiveField(0)
  final String moviename;
  @HiveField(1)
  final String directorname;
  @HiveField(2)
  final String genre;
  @HiveField(3)
  final String link;
  Moviemodel({this.moviename, this.directorname, this.genre, this.link});
}
