import 'dart:async';

import 'package:hive/hive.dart';
import 'package:my_quran/bloc/surah_bloc.dart';
import 'package:my_quran/models/ayat/ayat.dart';
import 'package:my_quran/models/surah/surah.dart';
import 'package:my_quran/network/api_response.dart';
import 'package:my_quran/repository/quran_repository.dart';

class QuranBloc {
  late QuranRepository _quranRepository;
  late StreamController<APIResponse<List<Surah>>> _quranSurahListController;

  StreamSink<APIResponse<List<Surah>>> get quranDataSink =>
      _quranSurahListController.sink;

  Stream<APIResponse<List<Surah>>> get quranDataStream =>
      _quranSurahListController.stream;

  QuranBloc() {
    _quranSurahListController = StreamController<APIResponse<List<Surah>>>();
    _quranRepository = QuranRepository();
    fetchSurahList();
  }

  void fetchSurahList() async {
    quranDataSink.add(APIResponse.loading('Fetching surah.....'));
    var _surahBox = Hive.box<Surah>('surah');
    if (_surahBox.isEmpty) {
      try {
        List<Surah> _surahs = await _quranRepository.fetchSurahList();
        _surahs.forEach((surah) {
          _surahBox.add(surah);
          surah.save();
        });
      } catch (e) {
        quranDataSink.add(APIResponse.error(e.toString()));
      }
      
    }
    quranDataSink.add(APIResponse.complete(_surahBox.values.toList()));
  }

  void dispose() {
    _quranSurahListController.close();
  }
}
