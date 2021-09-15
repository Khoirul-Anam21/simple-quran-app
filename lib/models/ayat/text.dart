import 'transliteration.dart';

class Text {
    Text({
        this.arab,
        this.transliteration,
    });

    String? arab;
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