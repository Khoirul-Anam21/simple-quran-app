import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  }
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
