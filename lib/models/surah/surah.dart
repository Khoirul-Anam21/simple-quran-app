import 'package:my_quran/models/ayat/ayat.dart';
import 'package:my_quran/repository/ayat_repository.dart';
import 'package:my_quran/repository/surah_repository.dart';

import 'name.dart';
import 'revelation.dart';

class Surah {
  Surah({
    this.number,
    this.sequence,
    this.numberOfVerses,
    this.name,
    this.revelation,
    this.preBismillah,
    this.verses,
  });

  int? number;
  int? sequence;
  int? numberOfVerses;
  Name? name;
  Revelation? revelation;
  dynamic preBismillah;
  List<Verse>? verses;

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
        number: json["number"],
        sequence: json["sequence"],
        numberOfVerses: json["numberOfVerses"],
        name: Name.fromJson(json["name"]),
        revelation: Revelation.fromJson(json["revelation"]),
        preBismillah: json["preBismillah"],
        );
  }


  

  Map<String, dynamic> toJson() => {
        "number": number,
        "sequence": sequence,
        "numberOfVerses": numberOfVerses,
        "name": name!.toJson(),
        "revelation": revelation!.toJson(),
        "preBismillah": preBismillah,
        "verses": List<dynamic>.from(verses!.map((x) => x.toJson())),
      };
}
