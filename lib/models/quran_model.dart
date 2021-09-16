import 'surah/surah.dart';

class QuranModel {
  QuranModel({
    required this.listSurah,
  });

  List<Surah> listSurah;

  factory QuranModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> _listSurahRaw = json['data'];
    List<Map<String, dynamic>> _surahs = _listSurahRaw.cast<Map<String, dynamic>>();
    List<Surah> _surahList =
        _surahs.map((data) => Surah.fromJson(data)).toList();
    return QuranModel(
      listSurah: _surahList,
    );
  }

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(listSurah.map((x) => x.toJson())),
      };
}
