import 'package:flutter/material.dart';
import 'package:my_quran/theme/themes.dart';

class AyatTile extends StatelessWidget {
  const AyatTile({
    Key? key,
  }) : super(key: key);

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
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircleAvatar(child: Text('No.')),
          SizedBox(
            width: 30,
          ),
          Flexible(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Arabian words are from right to left yo',
                    maxLines: 3,
                    textAlign: TextAlign.right,
                  ),
                  Text('This is the transliteration',
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
