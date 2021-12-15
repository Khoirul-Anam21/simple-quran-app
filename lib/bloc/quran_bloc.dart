import 'dart:async';

import 'package:hive/hive.dart';

import 'package:my_quran/models/surah/surah.dart';
import 'package:my_quran/network/api_response.dart';
import 'package:my_quran/repository/quran_repository.dart';

class QuranBloc {
  late QuranRepository _quranRepository;
  late StreamController<APIResponse<List<Surah>>> _quranSurahListController;
  var _surahBox = Hive.box<Surah>('surah');

  StreamSink<APIResponse<List<Surah>>> get quranDataSink =>
      _quranSurahListController.sink;

  Stream<APIResponse<List<Surah>>> get quranDataStream =>
      _quranSurahListController.stream;

  QuranBloc() {
    _quranSurahListController = StreamController<APIResponse<List<Surah>>>();
    _quranRepository = QuranRepository();
    if (_surahBox.isEmpty) {
      fetchSurahListFromServer();
      print('The local memory is empty');
    } else {
      fetchSurahListFromLocal();
      print('The local memory is not empty');
    }
  }

  void fetchSurahListFromLocal() async {
    quranDataSink.add(APIResponse.complete(_surahBox.values.toList()));
  }

  void fetchSurahListFromServer() async {
    quranDataSink.add(APIResponse.loading('Fetching surah.....'));
    try {
      List<Surah> _surahs = await _quranRepository.fetchSurahList();
      _surahBox.addAll(_surahs);
    } catch (e) {
      quranDataSink.add(APIResponse.error(e.toString()));
    }
    quranDataSink.add(APIResponse.complete(_surahBox.values.toList()));
  }

  void dispose() {
    _quranSurahListController.close();
  }
}
