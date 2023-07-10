import 'package:flutter/material.dart';
import 'package:wedding/future/page/calendar_page.dart';
import 'package:wedding/future/page/welcome_page.dart';

@immutable
class WeddingPage extends StatefulWidget {
  const WeddingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<WeddingPage> createState() => _WeddingPageState();
}

class _WeddingPageState extends State<WeddingPage> {
  late final ScrollController _controller;

  _scrollListener() {
    if (_controller.offset > 950) {
      print(_controller.position.pixels);
      // setState(() {
      //   message = "reach the bottom";
      // });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_scrollListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          // fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 533,
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 10,
                        spreadRadius: 4,
                        color: Colors.black38,
                      )
                    ],
                  ),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/backg.png'),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              controller: _controller,
              child: const Column(
                children: [
                  WelcomePage(),
                  CalendarPage(),
                ],
              ),
            ),
          ],
        ),
      );
}
