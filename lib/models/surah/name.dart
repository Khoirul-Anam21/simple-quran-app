import 'package:hive/hive.dart';

import '../ayat_translation.dart';
part '../adapters/surah/name.g.dart';

@HiveType(typeId: 4)
class Name extends HiveObject{
  Name({
    this.short,
    this.long,
    this.transliteration,
    this.translation,
  });

  String? short;
  String? long;
  Translation? transliteration;
  Translation? translation;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        short: json["short"],
        long: json["long"],
        transliteration: Translation.fromJson(json["transliteration"]),
        translation: Translation.fromJson(json["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "short": short,
        "long": long,
        "transliteration": transliteration!.toJson(),
        "translation": translation!.toJson(),
      };
}
