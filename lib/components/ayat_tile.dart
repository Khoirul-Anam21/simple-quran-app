import 'package:flutter/material.dart';
import 'package:my_quran/theme/themes.dart';

class AyatTile extends StatelessWidget {
  const AyatTile({
    Key? key,
    required this.ayat,
    required this.ayatNum,
    required this.transliteration,
  }) : super(key: key);

  final String ayat;
  final String transliteration;
  final int ayatNum;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppTheme.kTileColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(0, 6),
              color: AppTheme.kDarkShadeColor.withOpacity(0.3),
              blurRadius: 8,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircleAvatar(child: Text('$ayatNum')),
          SizedBox(
            width: 30,
          ),
          Flexible(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      ayat,
                      maxLines :null,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Text(transliteration,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.black54))
                ]),
          )
        ],
      ),
    );
  }
}
