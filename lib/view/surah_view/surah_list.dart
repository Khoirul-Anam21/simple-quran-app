import 'package:flutter/material.dart';

import 'package:my_quran/models/model_library.dart' as aqn;
import 'surah_tile_list.dart';

class SurahList extends StatelessWidget {
  const SurahList({Key? key, required this.surahs}) : super(key: key);

  final List<aqn.Surah> surahs;

  @override
  Widget build(BuildContext context) {
    return surahs==null
        ? Center(
            child: FlutterLogo(),
          )
        : SliverList(
            delegate: SliverChildListDelegate(surahs.map((surahData) {
            return SurahTile(surah: surahData);
          }).toList()));
  }
}
