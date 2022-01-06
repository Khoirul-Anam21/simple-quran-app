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
  late SurahBloc _ayatBloc;
  var _surahBox = Hive.box<Surah>('surah');
  var _ayatBox = Hive.box<Verse>('verse');

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
      _surahBox.values.forEach((surah) {
        print(surah.name!.transliteration!.id!);
        fetchAyatFromServer(surah.number!);
      });
    } catch (e) {
      quranDataSink.add(APIResponse.error(e.toString()));
    }
    quranDataSink.add(APIResponse.complete(_surahBox.values.toList()));
  }

  void fetchAyatFromServer(int surahNum) async{
    _ayatBloc = SurahBloc(surahNum: surahNum);
    _ayatBloc.ayatStream.listen((response) {
      switch (response.status) {
        case Status.Loading:
          print(response.message);
          break;
        case Status.Complete:
          print(response.data);
          addAyatToSurah(response, surahNum);
          break;
        case Status.Error:
          print(response.message);
          break;
        default:
          print('Failed');
      }
    });
  }

  void addAyatToSurah(APIResponse<List<Verse>> response, int surahNum) async{
    await _ayatBox.addAll(response.data!);
    var getSurah = _surahBox.values.elementAt(surahNum - 1);
    getSurah.verses = HiveList(_ayatBox);
    getSurah.verses!.addAll(response.data!);
    await getSurah.save();
  }
  
  void dispose() {
    _quranSurahListController.close();
  }
}
