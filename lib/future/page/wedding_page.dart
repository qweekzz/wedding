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
          children: [
            SingleChildScrollView(
              controller: _controller,
              child: const Column(
                children: [
                  WelcomePage(),
                  CalendarPage(),
                ],
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) => _controller.offset > 800
                  ? Padding(
                      padding: const EdgeInsets.only(right: 216),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset('assets/images/spot1.png'),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      );
}
