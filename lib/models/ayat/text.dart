import 'package:hive/hive.dart';

import 'transliteration.dart';

part '../adapters/ayat/text.g.dart';

@HiveType(typeId: 9)
class Text extends HiveObject{
    Text({
        this.arab,
        this.transliteration,
    });

    @HiveField(0)
    String? arab;

    @HiveField(1)
    AyatTransliteration? transliteration;

    factory Text.fromJson(Map<String, dynamic> json) => Text(
        arab: json["arab"],
        transliteration: AyatTransliteration.fromJson(json["transliteration"]),
    );

    Map<String, dynamic> toJson() => {
        "arab": arab,
        "transliteration": transliteration!.toJson(),
    };
}