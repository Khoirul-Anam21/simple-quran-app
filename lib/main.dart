import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:my_quran/bloc/quran_bloc.dart';
import 'package:my_quran/components/components.dart';
import 'package:my_quran/models/model_library.dart' as aqn;
import 'package:my_quran/models/surah/surah.dart';
import 'package:my_quran/network/api_response.dart';
import 'package:my_quran/repository/quran_repository.dart';
import 'package:my_quran/view/bookmarks.dart';
import 'package:my_quran/view/main_view/main_quran_view.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'theme/themes.dart';
import 'view/surah_view/main_surah_view.dart';

void main() async {
  await Hive.initFlutter();
  registerAdapter();
  await Hive.openBox<aqn.Surah>('surah');
  // await Hive.box<aqn.Surah>('surah').clear(); //restart the data fetching
  runApp(MyApp());
}

void registerAdapter() async {
  Hive.registerAdapter<aqn.Audio>(aqn.AudioAdapter());
  Hive.registerAdapter<aqn.Translation>(aqn.TranslationAdapter());
  Hive.registerAdapter<aqn.Surah>(aqn.SurahAdapter());
  Hive.registerAdapter<aqn.Name>(aqn.NameAdapter());
  Hive.registerAdapter<aqn.Revelation>(aqn.RevelationAdapter());
  Hive.registerAdapter<aqn.AyatInfo>(aqn.AyatInfoAdapter());
  Hive.registerAdapter<aqn.Sajda>(aqn.SajdaAdapter());
  Hive.registerAdapter<aqn.Verse>(aqn.VerseAdapter());
  Hive.registerAdapter<aqn.Number>(aqn.NumberAdapter());
  Hive.registerAdapter<aqn.AyatTransliteration>(
      aqn.AyatTransliterationAdapter());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider(
            create: (context) => QuranBloc().quranDataStream,
            initialData: APIResponse<List<Surah>>.loading('Loading'))
      ],
      child: MaterialApp(
        title: 'Flutter Demo n',
        debugShowCheckedModeBanner: false,
        scrollBehavior: CustomScrollBehaviour(),
        theme: ThemeData(
            textTheme: AppTheme.kMainTextTheme,
            primaryColor: AppTheme.kPrimaryColor,
            scaffoldBackgroundColor: AppTheme.kBgColor,
            appBarTheme: AppBarTheme(backgroundColor: AppTheme.kPrimaryColor)),
        routes: {
          '/': (context) => QuranView(),
          '/surah': (context) => SurahView(),
          '/bookmark': (context) => BookMarkView()
        },
        initialRoute: '/',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  int _counter = 0;
  late QuranBloc qurBloc;
  late AudioPlayer quranPlayer;
  List<AudioSource> reciteUrls = <AudioSource>[
    AudioSource.uri(
        Uri.parse('https://cdn.alquran.cloud/media/audio/ayah/ar.alafasy/1')),
    AudioSource.uri(
        Uri.parse('https://cdn.alquran.cloud/media/audio/ayah/ar.alafasy/2')),
    AudioSource.uri(
        Uri.parse('https://cdn.alquran.cloud/media/audio/ayah/ar.alafasy/3')),
    AudioSource.uri(
        Uri.parse('https://cdn.alquran.cloud/media/audio/ayah/ar.alafasy/4')),
    AudioSource.uri(
        Uri.parse('https://cdn.alquran.cloud/media/audio/ayah/ar.alafasy/5')),
    AudioSource.uri(
        Uri.parse('https://cdn.alquran.cloud/media/audio/ayah/ar.alafasy/6')),
    AudioSource.uri(
        Uri.parse('https://cdn.alquran.cloud/media/audio/ayah/ar.alafasy/7')),
  ];

  @override
  void initState() {
    qurBloc = QuranBloc();
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
    quranPlayer = AudioPlayer();
    initAudio();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    quranPlayer.dispose();
    super.dispose();
    qurBloc.dispose();
  }

  void initAudio() async {
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.music());

    await quranPlayer.setAudioSource(
        ConcatenatingAudioSource(
            children: reciteUrls, useLazyPreparation: true),
        initialIndex: 0,
        initialPosition: Duration.zero);
  }

  void playQuran() async {
    if (!quranPlayer.playing) {
      await quranPlayer.play();
    }
  }

  void _incrementCounter() async {
    setState(() {
      _counter++;
    });
    playQuran();
    testQuranRepo();
  }

  void testQuranRepo() async {
    QuranRepository _quranRepo = QuranRepository();
    List<aqn.Surah> _surahs = await _quranRepo.fetchSurahList();
    _surahs.forEach((element) => print(element.name));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            StreamBuilder<APIResponse<List<aqn.Surah>>>(
                stream: qurBloc.quranDataStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    switch (snapshot.data!.status) {
                      case Status.Loading:
                        return CircularProgressIndicator();
                      case Status.Error:
                        return Text('Error');
                      case Status.Complete:
                        return Text(
                            '${snapshot.data!.data!.elementAt(3).name!.long}');
                      default:
                        throw Exception('Error');
                    }
                  }
                  return Text('Loading');
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
