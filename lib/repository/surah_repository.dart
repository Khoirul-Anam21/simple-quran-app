import 'package:my_quran/models/ayat/ayat.dart';

import 'package:my_quran/network/api_helper.dart';

class SurahRepository {
  APIBaseHelper _helper = APIBaseHelper();

  Future<List<Verse>> fetchVerses(int surahNum) async {
    final response = await _helper.getData('${surahNum.toString()}');
    List<dynamic> verses = response['data']['verses'];
    // print('result -> ${response['data']['verses']}');
    var responseSurah = List<Verse>.from(verses.map((e) => Verse.fromJson(e)));
    return responseSurah;
  }
}


