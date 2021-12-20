import 'package:flutter/material.dart';
import 'package:my_quran/theme/themes.dart';
import 'package:my_quran/components/components.dart';

class AyatView extends StatefulWidget {
  const AyatView({Key? key}) : super(key: key);

  @override
  State<AyatView> createState() => _AyatViewState();
}

class _AyatViewState extends State<AyatView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 20, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
                tabs: List.generate(
                    20,
                    (index) => Tab(
                          text: '$index\. Al-Quran',
                        )))),
        body: TabBarView(
            controller: _tabController,
            children: List.generate(20, (index) => AyatBody())));
  }
}

class AyatBody extends StatelessWidget {
  const AyatBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        AyatTitle(),
        ...List.generate(25, (index) => AyatTile())
      ],
    );
  }
}



