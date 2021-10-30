import 'package:hive/hive.dart';


part 'adapters/ayat_translation.g.dart';

@HiveType(typeId: 1)
class Translation extends HiveObject{
  Translation({
    this.en,
    this.id,
  });

  @HiveField(0)
  String? en;

  @HiveField(1)
  String? id;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        en: json["en"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "id": id,
      };
}
