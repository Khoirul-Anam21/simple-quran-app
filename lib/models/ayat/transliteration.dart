import 'package:hive/hive.dart';

part '../adapters/ayat/transliteration.g.dart';

@HiveType(typeId: 10)
class AyatTransliteration extends HiveObject{
    AyatTransliteration({
        this.en,
    });
    @HiveField(0)
    String? en;

    factory AyatTransliteration.fromJson(Map<String, dynamic> json) => AyatTransliteration(
        en: json["en"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
    };
}
