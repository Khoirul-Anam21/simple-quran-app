import 'dart:async';

import 'package:my_quran/models/ayat/ayat.dart';
import 'package:my_quran/network/api_response.dart';
import 'package:my_quran/repository/surah_repository.dart';

class SurahBloc {
  late SurahRepository _surahRepository;
  late StreamController<APIResponse<List<Verse>>> _surahController;
  int surahNum;

  StreamSink<APIResponse<List<Verse>>> get ayatSink => _surahController.sink;
  Stream<APIResponse<List<Verse>>> get ayatStream => _surahController.stream;

  SurahBloc({required this.surahNum}) {
    _surahRepository = SurahRepository();
    _surahController = StreamController<APIResponse<List<Verse>>>();
    fetchAyatPerSurah();
  }

  void fetchAyatPerSurah() async {
    ayatSink.add(APIResponse.loading('Fetching ayat..'));
    try {
      List<Verse> ayats = await _surahRepository.fetchVerses(surahNum);
      ayatSink.add(APIResponse.complete(ayats));
    } catch (e) {
      ayatSink.add(APIResponse.error(e.toString()));
    }
  }

  void dispose() {
    _surahController.close();
  }
}


