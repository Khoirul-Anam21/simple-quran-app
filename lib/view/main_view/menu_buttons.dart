import 'package:flutter/material.dart';
import 'package:my_quran/components/components.dart';
import 'package:my_quran/models/model_library.dart';
import 'package:my_quran/network/api_response.dart';
import 'package:provider/provider.dart';


class ReadQuranMenuButton extends StatelessWidget {
  const ReadQuranMenuButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<APIResponse<List<Surah>>>(
        builder: (context, response, child) {
      bool isLoadingData = response.status == Status.Loading;
      bool isError = response.status == Status.Error;
      return QuranButton(
          title: isLoadingData
              ? 'Loading data..'
              : isError
                  ? 'Can\'t get data'
                  : 'Read Quran',
          navigate: '/surah',
          onTap: () {
            if (!isError || !isLoadingData) {
              Navigator.pushNamed(context, '/surah');
            } else {
              return;
            }
          },
          imageURL:
              'assets/images/islamic-new-year-decoration-with-praying-beads-quran.jpg');
    });
  }
}
