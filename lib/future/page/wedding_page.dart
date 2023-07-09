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
  late final bool _selected;
  late final OverlayEntry _overlayEntry;
  late final OverlayState _overlayState;

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
            const Align(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('assets/images/backg.png'),
              ),
            ),
            // const DecoratedBox(
            //   decoration: BoxDecoration(
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.black45,
            //         spreadRadius: 4,
            //         blurRadius: 12,
            //         offset: Offset(0, 4),
            //       ),
            //     ],
            //   ),
            //   child: Image(
            //     image: AssetImage('assets/images/spot1.png'),
            //   ),
            // ),
            SingleChildScrollView(
              controller: _controller,
              child: const Column(
                children: [
                  WelcomePage(),
                  CalendarPage(),
                  //сюда верстку
                ],
              ),
            ),
          ],
        ),
      );
}
