import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class CalendarPage extends StatelessWidget {
  const CalendarPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.topCenter,
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  spreadRadius: 4,
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ColoredBox(
              color: Colors.white,
              child: Column(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 533),
                    child: const _MainStack(),
                  ),
                ],
              ),
            ),
          )
        ],
      );
}

List<Widget> listWidgets() {
  return [
    Positioned(
      top: 740,
      left: 0,
      child: Image.asset('assets/images/Line1.png'),
    ),
    Positioned(
      top: 752,
      left: 0,
      child: Image.asset('assets/images/Line1.png'),
    ),
    // Positioned(
    //   top: 82,
    //   left: 0,
    //   child: Image.asset('assets/images/spot1.png'),
    // ),
    // Positioned(
    //   top: 375,
    //   right: 0,
    //   child: Image.asset('assets/images/spot2.png'),
    // ),
    Positioned(
      top: 6,
      right: 0,
      child: Image.asset('assets/images/flowers2.png'),
    ),
    Positioned(
      top: 822,
      right: 0,
      child: Image.asset('assets/images/flowers2.png'),
    ),
    Positioned(
      top: 353,
      left: 0,
      child: Image.asset('assets/images/flowers1.png'),
    ),
  ];
}

@immutable
class _MainStack extends StatelessWidget {
  const _MainStack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.center,
        children: [
          ...listWidgets(),
          const Column(
            children: [
              _CalendarAndFlowers(),
              _WeddingPlan(),
            ],
          )
        ],
      );
}

@immutable
class _WeddingPlan extends StatelessWidget {
  const _WeddingPlan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 160),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 70),
              child: _TopicText(headText: 'План мероприятия'),
            ),
            DefaultTextStyle(
              style: GoogleFonts.ptSansNarrow(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      _PlanColumn(
                        firstImg: 'assets/images/calendar2.png',
                        firstTitle: 'Сбор гостей\n 14:30',
                        secondImg: 'assets/images/wine.png',
                        secondTitle: 'Банкет\n16:00',
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: _DividerPlan(),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 136),
                        child: _PlanColumn(
                          firstImg: 'assets/images/wedding-rings.png',
                          firstTitle: 'Регистрация бракосочетания\n15:00',
                          secondImg: 'assets/images/fireworks.png',
                          secondTitle: 'Завершение вечера\n22:00',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
}

//todo o.75x size icon
@immutable
class _DividerPlan extends StatelessWidget {
  const _DividerPlan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomPaint(
        size: Size(
            11,
            (11 * 49.72727272727273)
                .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
        painter: RPSCustomPainter(),
      );
}

@immutable
class _PlanColumn extends StatelessWidget {
  final String firstImg;
  final String firstTitle;

  final String secondImg;
  final String secondTitle;

  const _PlanColumn({
    required this.firstImg,
    required this.firstTitle,
    required this.secondImg,
    required this.secondTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Image(
            image: AssetImage(firstImg),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              firstTitle,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Image(
              image: AssetImage(secondImg),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              secondTitle,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
}

@immutable
class _CalendarAndFlowers extends StatelessWidget {
  const _CalendarAndFlowers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 130),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: _TopicText(
                headText: 'Дорогие наши\nдрузья и родные!',
                bodyText: 'Вы получили эту ссылку,\n'
                    'а значит, мы спешим сообщить\n'
                    'вам важную новость!',
              ),
            ),
            const _TopicText(
              headText: 'Мы женимся!',
              bodyText: 'Мы хотели бы видеть вас на\n'
                  'нашей свадьбе и разделить с вами этот\n'
                  'счастливый праздник!',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 15),
              child: Text(
                'Ждем вас на нашей свадьбе!\nНачало в 14.30',
                style: GoogleFonts.ptSansNarrow(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Stack(
              children: [
                Image(
                  image: AssetImage('assets/images/calendar.png'),
                ),
                Positioned(
                  top: 114,
                  left: 145,
                  child: Image(
                    image: AssetImage('assets/images/heart.png'),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}

@immutable
class _TopicText extends StatelessWidget {
  final String headText;
  final String? bodyText;

  const _TopicText({
    required this.headText,
    this.bodyText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text(
            headText.toUpperCase(),
            style: GoogleFonts.amaticSc(
              fontWeight: FontWeight.w700,
              fontSize: 40,
            ),
            textAlign: TextAlign.center,
          ),
          if (bodyText != null)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                bodyText ?? '',
                style: GoogleFonts.ptSansNarrow(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      );
}

//todo В отдельный файл
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint_0_stroke.color = Colors.black.withOpacity(1.0);
    canvas.drawLine(Offset(size.width * 0.5000000, size.height * 3.995558e-11),
        Offset(size.width * 0.4999982, size.height), paint_0_stroke);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Colors.black.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.5000000, size.height * 0.1106033),
        size.width * 0.5000000, paint_1_fill);

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Colors.black.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.5000000, size.height * 0.3683729),
        size.width * 0.5000000, paint_2_fill);

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Colors.black.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.5000000, size.height * 0.6261426),
        size.width * 0.5000000, paint_3_fill);

    Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
    paint_4_fill.color = Colors.black.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.5000000, size.height * 0.8839122),
        size.width * 0.5000000, paint_4_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class DressCode extends StatelessWidget {
  const DressCode({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
      );
}
