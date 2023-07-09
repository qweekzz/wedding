import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding/future/page/widgets/wedding_timer.dart';

@immutable
class WelcomePage extends StatelessWidget {
  const WelcomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: Size(
                MediaQuery.of(context).size.width,
                (MediaQuery.of(context).size.height).toDouble(),
              ),
              painter: RPSCustomPainter(),
            ),
            Stack(
              children: [
                const _Picture(),
                Align(
                  alignment: Alignment.centerRight,
                  child: DefaultTextStyle(
                    style: GoogleFonts.ptSansNarrow(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _DateCol(),
                        _TimeCol(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.5065104, size.height * 0.4893519),
        Offset(size.width * 0.5000000, size.height), [
      Color(0xff858690).withOpacity(0.58),
      Color(0xff3E5064).withOpacity(1),
      Color(0xff50676F).withOpacity(1)
    ], [
      0,
      0.124496,
      0.462306
    ]);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 1.009115, size.height * 0.5490741);
    path_1.lineTo(size.width * 0.6575521, size.height * 0.5171296);
    path_1.cubicTo(
        size.width * 0.5439219,
        size.height * 0.5006176,
        size.width * 0.2935417,
        size.height * 0.4657407,
        size.width * 0.2010417,
        size.height * 0.4583333);
    path_1.cubicTo(
        size.width * 0.1085417,
        size.height * 0.4509259,
        size.width * 0.009201406,
        size.height * 0.4753083,
        size.width * -0.02890625,
        size.height * 0.4884259);
    path_1.lineTo(size.width * -0.02890625, size.height * -0.05833333);
    path_1.lineTo(size.width * 1.009115, size.height * -0.06805556);
    path_1.lineTo(size.width * 1.009115, size.height * 0.5490741);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.4901042, size.height * 0),
        Offset(size.width * 0.4901042, size.height * 0.5490741), [
      Color(0xff88A9DB).withOpacity(1),
      Color(0xffE3E0D4).withOpacity(1),
      Color(0xffE3BE9A).withOpacity(1),
      Color(0xffE09E85).withOpacity(1)
    ], [
      0.248731,
      0.71557,
      0.875529,
      0.961608
    ]);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

@immutable
class _Picture extends StatelessWidget {
  const _Picture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.center,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white60,
                spreadRadius: 4,
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Image(
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            image: const AssetImage('assets/images/test.png'),
          ),
        ),
      );
}

@immutable
class _DateCol extends StatelessWidget {
  const _DateCol({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const Text('ЧЕТВЕРГ'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              '17 АВГУСТА',
              style: TextStyle(fontSize: 24),
            ),
          ),
          const Text('2023'),
          Padding(
            padding: const EdgeInsets.only(top: 110),
            child: Text(
              'Дарья и Петр',
              style: GoogleFonts.pacifico(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
        ],
      );
}

@immutable
class _TimeCol extends StatelessWidget {
  const _TimeCol({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.only(bottom: 40),
        child: Column(
          children: [
            Text('ДО СВАДЬБЫ ОСТАЛОСЬ'),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: WeddingTimer(),
            ),
            Image(
              image: AssetImage(
                'assets/images/Arrow.png',
              ),
              color: Colors.white,
            )
          ],
        ),
      );
}
