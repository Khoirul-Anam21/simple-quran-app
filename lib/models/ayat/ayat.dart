import 'package:hive/hive.dart';

import '../audio.dart';
import '../ayat_translation.dart';
import 'ayat_info.dart';
import 'number.dart';
import 'text.dart';

part '../adapters/ayat/ayat.g.dart';

@HiveType(typeId: 5)
class Verse extends HiveObject{
    Verse({
        this.number,
        this.meta,
        this.text,
        this.translation,
        this.audio,
    });

    @HiveField(0)
    Number? number;

    @HiveField(1)
    AyatInfo? meta;

    @HiveField(2)
    Text? text;

    @HiveField(3)
    Translation? translation;
    
    @HiveField(4)
    Audio? audio;

    factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        number: Number.fromJson(json["number"]),
        meta: AyatInfo.fromJson(json["meta"]),
        text: Text.fromJson(json["text"]),
        translation: Translation.fromJson(json["translation"]),
        audio: Audio.fromJson(json["audio"]),
    );

    Map<String, dynamic> toJson() => {
        "number": number!.toJson(),
        "meta": meta!.toJson(),
        "text": text!.toJson(),
        "translation": translation!.toJson(),
        "audio": audio!.toJson(),
    };
}