
import 'package:hive/hive.dart';
import 'package:my_quran/models/ayat/ayat.dart';


import 'name.dart';
import 'revelation.dart';

part '../adapters/surah/surah.g.dart';


@HiveType(typeId: 2)
class Surah extends HiveObject{
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
