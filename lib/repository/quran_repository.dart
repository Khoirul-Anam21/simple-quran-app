import 'package:my_quran/models/quran_model.dart';
import 'package:my_quran/models/surah/surah.dart';
import 'package:my_quran/network/api_helper.dart';

class QuranRepository {
  APIBaseHelper _helper = APIBaseHelper();

  Future<List<Surah>> fetchSurahList() async {
    final response = await _helper.getData('');
    var responseQuran = QuranModel.fromJson(response);
    return responseQuran.listSurah!;
  }
}
