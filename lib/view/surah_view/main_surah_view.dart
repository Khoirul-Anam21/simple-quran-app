import 'package:flutter/material.dart';
import 'package:my_quran/models/surah/surah.dart';
import 'package:my_quran/network/api_response.dart';
import 'package:my_quran/theme/themes.dart';
import 'package:provider/provider.dart';

import 'surah_list.dart';

class SurahView extends StatefulWidget {
  const SurahView({Key? key}) : super(key: key);

  @override
  State<SurahView> createState() => _SurahViewState();
}

class _SurahViewState extends State<SurahView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<APIResponse<List<Surah>>>(
      builder: (BuildContext context, response, Widget? child) {
        response.data!.forEach((surah) {
          print('${surah.name!.transliteration!.id}  ${surah.verses}');
        });
        return SurahBody(surahData: response.data!);
      },
    ));
  }
}

class SurahBody extends StatelessWidget {
  const SurahBody({
    Key? key,
    required this.surahData,
  }) : super(key: key);

  final List<Surah> surahData;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
            title: TextField(
              decoration: InputDecoration(
                hintText: 'Cari surah',
                prefix: const SizedBox(width: 15),
                suffixIcon: Icon(Icons.search, color: Colors.white54),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        BorderSide(color: Colors.white.withOpacity(0.3))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        BorderSide(color: Colors.white.withOpacity(0.5))),
              ),
            ),
            // backgroundColor: Colors.transparent,
            pinned: true,
            expandedHeight: 140,
            flexibleSpace: LayoutBuilder(builder: (_, constraints) {
              print(constraints.maxHeight);
              bool isCollapsed = constraints.maxHeight < 90;
              return FlexibleSpaceBar(
                title: isCollapsed
                    ? SizedBox.shrink()
                    : Text('Daftar Surah',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.white70)),
                background: ShaderMask(
                    blendMode: BlendMode.overlay,
                    shaderCallback: (rect) => LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              AppTheme.kDarkShadeColor.withOpacity(0.27),
                              AppTheme.kDarkShadeColor.withOpacity(0.8)
                            ]).createShader(rect),
                    child: Image.asset(
                      'assets/images/mosque-vector.jpg',
                      fit: BoxFit.cover,
                    )),
              );
            })),
        SurahList(surahs: surahData)
      ],
    );
  }
}
