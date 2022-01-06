import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_quran/models/ayat/ayat.dart';
import 'package:my_quran/models/surah/surah.dart';
import 'package:my_quran/network/api_response.dart';
import 'package:my_quran/theme/themes.dart';
import 'package:provider/provider.dart';
import 'package:my_quran/components/components.dart';

class AyatView extends StatefulWidget {
  const AyatView({Key? key, this.selectionNum = 0}) : super(key: key);

  //TODO: Prototype, Use provider instead
  final int? selectionNum;

  @override
  State<AyatView> createState() => _AyatViewState();
}

class _AyatViewState extends State<AyatView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 114, vsync: this, initialIndex: widget.selectionNum! - 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Surah> getData() {
    var surahConsumer = context.watch<APIResponse<List<Surah>>>();
    List<Surah> surahs = [];
    switch (surahConsumer.status) {
      case Status.Loading:
        print('lol');
        break;
      case Status.Error:
        print('lol error');
        break;
      case Status.Complete:
        surahs = surahConsumer.data!;
        break;
      default:
        print('no Data');
    }
    return surahs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Baca Al-Qur\'an'),
            elevation: 0,
            centerTitle: true,
            actions: <Widget>[
              IconButton(onPressed: () {}, icon: Icon(Icons.find_in_page))
            ],
            bottom: TabBar(
                indicatorColor: Colors.white70,
                isScrollable: true,
                controller: _tabController,
                labelStyle: TextStyle(color: Colors.white),
                unselectedLabelStyle: TextStyle(color: Colors.white54),
                tabs: getData()
                    .map((surah) => Tab(
                          text:
                              '${surah.number} ${surah.name!.transliteration!.id}',
                        ))
                    .toList())),
        body: TabBarView(
            controller: _tabController,
            children: getData()
                .map((surah) => AyatBody(ayats: surah.verses!))
                .toList()));
  }
}

class AyatBody extends StatelessWidget {
  const AyatBody({Key? key, required this.ayats}) : super(key: key);

  final HiveList<Verse> ayats;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        AyatTitle(),
        ...ayats
            .map((ayat) => AyatTile(
                  ayat: ayat.text!.arab!,
                  transliteration: ayat.text!.transliteration!.en!,
                  ayatNum: ayat.number!.inSurah!,
                ))
            .toList(),
      ],
    );
  }
}
