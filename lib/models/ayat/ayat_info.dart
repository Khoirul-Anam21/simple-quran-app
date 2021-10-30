import 'package:hive/hive.dart';

import 'ayat_sajadah.dart';

part '../adapters/ayat/ayat_info.g.dart';

@HiveType(typeId: 7)
class AyatInfo extends HiveObject{
  AyatInfo({
    this.juz,
    this.page,
    this.manzil,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });
  @HiveField(0)
  int? juz;

  @HiveField(1)
  int? page;

  @HiveField(2)
  int? manzil;

  @HiveField(3)
  int? ruku;

  @HiveField(4)
  int? hizbQuarter;

  @HiveField(5)
  Sajda? sajda;

  factory AyatInfo.fromJson(Map<String, dynamic> json) => AyatInfo(
        juz: json["juz"],
        page: json["page"],
        manzil: json["manzil"],
        ruku: json["ruku"],
        hizbQuarter: json["hizbQuarter"],
        sajda: Sajda.fromJson(json["sajda"]),
      );

  Map<String, dynamic> toJson() => {
        "juz": juz,
        "page": page,
        "manzil": manzil,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
        "sajda": sajda!.toJson(),
      };
}
