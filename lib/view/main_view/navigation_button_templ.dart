import 'package:flutter/material.dart';

class QuranButton extends StatelessWidget {
  const QuranButton(
      {Key? key,
      required this.title,
      this.navigate,
      required this.imageURL,
      this.isLastRead = false})
      : super(key: key);

  final String title;
  final String imageURL;
  final bool? isLastRead;
  final String? navigate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.pushNamed(context, navigate!),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 9,
                  spreadRadius: -4,
                  color: Theme.of(context).primaryColor.withOpacity(0.5))
            ],
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('$imageURL'),
            )),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Theme.of(context).primaryColor.withOpacity(0.1),
                  Theme.of(context).primaryColor.withOpacity(0.8)
                ]),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$title', style: Theme.of(context).textTheme.bodyText1),
              isLastRead!
                  ? Text('Q.S Al Imran 21',
                      style: Theme.of(context).textTheme.caption)
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

class LastReadText extends StatefulWidget {
  LastReadText({Key? key}) : super(key: key);

  @override
  _LastReadTextState createState() => _LastReadTextState();
}

class _LastReadTextState extends State<LastReadText> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
