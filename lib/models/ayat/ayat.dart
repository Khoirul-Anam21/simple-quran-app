import '../audio.dart';
import '../ayat_translation.dart';
import 'ayat_info.dart';
import 'number.dart';
import 'text.dart';

class Verse {
    Verse({
        this.number,
        this.meta,
        this.text,
        this.translation,
        this.audio,
    });

    Number? number;
    AyatInfo? meta;
    Text? text;
    Translation? translation;
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