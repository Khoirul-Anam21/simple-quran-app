import 'package:hive/hive.dart';

part '../adapters/ayat/ayat_sajadah.g.dart';

@HiveType(typeId: 8)
class Sajda extends HiveObject{
  Sajda({
    this.recommended,
    this.obligatory,
  });
  @HiveField(0)
  bool? recommended;

  @HiveField(1)
  bool? obligatory;

  factory Sajda.fromJson(Map<String, dynamic> json) => Sajda(
        recommended: json["recommended"],
        obligatory: json["obligatory"],
      );

  Map<String, dynamic> toJson() => {
        "recommended": recommended,
        "obligatory": obligatory,
      };
}
