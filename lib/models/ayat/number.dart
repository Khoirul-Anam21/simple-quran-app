class Number {
    Number({
        this.inQuran,
        this.inSurah,
    });

    int? inQuran;
    int? inSurah;

    factory Number.fromJson(Map<String, dynamic> json) => Number(
        inQuran: json["inQuran"],
        inSurah: json["inSurah"],
    );

    Map<String, dynamic> toJson() => {
        "inQuran": inQuran,
        "inSurah": inSurah,
    };
}