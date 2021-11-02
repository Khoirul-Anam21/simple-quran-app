import 'package:flutter/material.dart';

import 'package:my_quran/models/model_library.dart' as aqn;

class SurahList extends StatelessWidget {
  const SurahList({Key? key, required this.surahs}) : super(key: key);

  final List<aqn.Surah> surahs;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate(surahs.map((e) {
      return ListTile(
        title: Text('${e.name!.long}'),
      );
    }).toList()));
  }
}
