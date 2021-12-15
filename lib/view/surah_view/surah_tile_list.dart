import 'package:flutter/material.dart';
import 'package:my_quran/models/surah/surah.dart';
import 'package:my_quran/theme/themes.dart';

class SurahTile extends StatelessWidget {
  const SurahTile({
    Key? key,
    required this.surah,
  }) : super(key: key);

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppTheme.kTileColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(0,6),
            blurRadius: 6,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.16),
          )
        ]
      ),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[350],
                    child: Text('${surah.number}')),
                const SizedBox(
                  width: 8,
                ),
                Text('${surah.revelation!.id} | ${surah.numberOfVerses} ayat',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.black45))
              ],
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Directionality(textDirection: TextDirection.rtl, child: Text('${surah.name!.short}', style: Theme.of(context).textTheme.headline5, overflow: TextOverflow.ellipsis)),
                  Text('${surah.name!.translation!.id}', style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.black45)),
                ]),
          ],
        ),
      ),
    );
  }
}
