import 'package:hive/hive.dart';

part '../adapters/surah/revelation.g.dart';

@HiveType(typeId: 3)
class Revelation extends HiveObject{
  Revelation({
    this.arab,
    this.en,
    this.id,
  });
  @HiveField(0)
  String? arab;

  @HiveField(1)
  String? en;

  @HiveField(2)
  String? id;

  factory Revelation.fromJson(Map<String, dynamic> json) => Revelation(
        arab: json["arab"],
        en: json["en"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "en": en,
        "id": id,
      };
}
