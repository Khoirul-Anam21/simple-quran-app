import 'package:flutter/material.dart';
import 'package:my_quran/components/components.dart';
import 'package:my_quran/view/ayat_view/main_ayat_view.dart';
import 'package:my_quran/view/main_view/menu_buttons.dart';

class QuranView extends StatelessWidget {
  const QuranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title:
              Text('Quran App', style: Theme.of(context).textTheme.headline6),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.info, color: Theme.of(context).primaryColor))
          ],
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Text('Read Quran & Gain Your Peace',
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.center),
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                width: 120,
                height: 6,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 20),
              ReadQuranMenuButton(),
              QuranButton(
                title: 'Last Read',
                imageURL:
                    'assets/images/islamic-new-year-decoration-with-traditional-food-quran.jpg',
                isLastRead: true,
              ),
              QuranButton(
                  title: 'Bookmarks',
                  navigate: '/bookmark',
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => AyatView()));
                  },
                  imageURL:
                      'assets/images/prayer-beads-candle-near-religious-book.jpg')
            ]));
  }
}
