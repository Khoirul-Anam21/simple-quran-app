import 'surah/surah.dart';

class QuranModel {
  QuranModel({
    required this.listSurah,
  });

  List<Surah>? listSurah;

  QuranModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> _listSurahRaw = json['data'];
    listSurah = <Surah>[];
    _listSurahRaw.forEach((element) => listSurah!.add(Surah.fromJson(element)));
  }

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(listSurah!.map((x) => x.toJson())),
      };
}
