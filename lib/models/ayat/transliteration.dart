class AyatTransliteration {
    AyatTransliteration({
        this.en,
    });

    String? en;

    factory AyatTransliteration.fromJson(Map<String, dynamic> json) => AyatTransliteration(
        en: json["en"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
    };
}
