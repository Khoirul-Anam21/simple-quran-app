import 'package:hive/hive.dart';

part '../adapters/ayat/number.g.dart';

@HiveType(typeId: 6)
class Number extends HiveObject{
    Number({
        this.inQuran,
        this.inSurah,
    });

    @HiveField(0)
    int? inQuran;

    @HiveField(1)
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