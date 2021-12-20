import 'package:flutter/material.dart';
import 'package:my_quran/theme/themes.dart';

class AyatTitle extends StatelessWidget {
  const AyatTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                AppTheme.kPrimaryColor,
                AppTheme.kSecondaryColor,
              ])),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //TODO: USE EXPANDED WITH FLEX
            Text('Al-Faatihah',
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: AppTheme.kYellowTextColor)),
            Text(
              '\"Pembukaan\"',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white70),
            ),
            const SizedBox(height: 20),
            Text(
              'Surah 1 | Juz 1 | Turun ke 5',
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(height: 25),
            Text(
              'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيم',
              style: TextStyle(color: AppTheme.kYellowTextColor),
            ),
          ]),
    );
  }
}
