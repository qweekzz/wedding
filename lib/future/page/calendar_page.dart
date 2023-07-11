// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding/future/page/dress_code.dart';
import 'package:wedding/future/page/drink_page.dart';
import 'package:wedding/future/page/wedding_place.dart';
import 'package:wedding/future/page/wishes.dart';

import 'widgets/widgets.dart';

@immutable
class CalendarPage extends StatelessWidget {
  const CalendarPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 533),
        child: const _MainStack(),
      );
}

List<Widget> listWidgets(BuildContext context) {
  final String x3 = MediaQuery.of(context).size.width > 500 ? '2.0x' : '';

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
    Positioned(
      top: MediaQuery.of(context).size.width > 500 ? 6 : 50,
      right: 0,
      child: Image.asset('assets/images/$x3/fw2.png'),
    ),
    Positioned(
      top: MediaQuery.of(context).size.width > 500 ? 822 : 1700,
      right: 0,
      child: Image.asset('assets/images/$x3/fw2.png'),
    ),
    Positioned(
      top: MediaQuery.of(context).size.width > 500 ? 2055 : 2770,
      right: 0,
      child: Image.asset('assets/images/$x3/fw2.png'),
    ),
    Positioned(
      top: MediaQuery.of(context).size.width > 500 ? 2804 : 3440,
      right: 0,
      child: Image.asset('assets/images/$x3/fw2.png'),
    ),
    Positioned(
      top: MediaQuery.of(context).size.width > 500 ? 3403 : 4000,
      right: 0,
      child: Image.asset('assets/images/$x3/fw2.png'),
    ),
    Positioned(
      top: MediaQuery.of(context).size.width > 500 ? 353 : 400,
      left: 0,
      child: Image(
        fit: BoxFit.cover,
        image: AssetImage('assets/images/$x3/fw1.png'),
      ),
    ),
    Positioned(
      top: MediaQuery.of(context).size.width > 500 ? 1582 : 1350,
      left: 0,
      child: Image.asset('assets/images/$x3/fw1.png'),
    ),
    Positioned(
      top: MediaQuery.of(context).size.width > 500 ? 2658 : 2060,
      left: 0,
      child: Image(
        image: AssetImage('assets/images/$x3/fw1.png'),
      ),
    ),
    Positioned(
      top: MediaQuery.of(context).size.width > 500 ? 3403 : 3280,
      left: 0,
      child: Image.asset('assets/images/$x3/fw1.png'),
    ),
    if (MediaQuery.of(context).size.width <= 500)
      Positioned(
        bottom: 1100,
        left: 0,
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/$x3/fw1.png'),
        ),
      ),
    MediaQuery.of(context).size.width > 500
        ? Positioned(
            bottom: 255,
            left: 0,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/$x3/fw1.png'),
            ),
          )
        : Positioned(
            bottom: 255,
            right: 0,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/$x3/fw2.png'),
            ),
          ),
  ];
}

@immutable
class _MainStack extends StatefulWidget {
  const _MainStack({
    Key? key,
  }) : super(key: key);

  @override
  State<_MainStack> createState() => _MainStackState();
}

class _MainStackState extends State<_MainStack> {
  late final ValueNotifier<List<int>> _select;

  @override
  void initState() {
    super.initState();
    _select = ValueNotifier([]);
  }

  @override
  void dispose() {
    _select.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.center,
        children: [
          ...listWidgets(context),
          Column(
            children: [
              const _CalendarAndFlowers(),
              MediaQuery.of(context).size.width > 500
                  ? const _WeddingPlanDesc()
                  : const _WeddingPlanMobile(),
              const WeddingPlace(),
              const DressCode(),
              const Wishes(),
              DrinkPage(
                select: _select,
              ),
              _SendButton(
                select: _select,
              ),
            ],
          ),
        ],
      );
}

@immutable
class _WeddingPlanMobile extends StatelessWidget {
  const _WeddingPlanMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 160),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 70),
              child: TopicText(headText: 'План мероприятия'),
            ),
            DefaultTextStyle(
              style: GoogleFonts.ptSansNarrow(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              child: const Column(
                children: [
                  _PlanColumMobile(
                    img: 'assets/images/calendar2.png',
                    title: 'Сбор гостей',
                  ),
                  _PlanColumMobile(
                    img: 'assets/images/wedding-rings.png',
                    title: 'Регистрация бракосочетания',
                  ),
                  _PlanColumMobile(
                    img: 'assets/images/wine.png',
                    title: 'Банкет',
                  ),
                  _PlanColumMobile(
                    img: 'assets/images/fireworks.png',
                    line: false,
                    title: 'Завершение вечера',
                  ),
                ],
              ),
            )
          ],
        ),
      );
}

@immutable
class _WeddingPlanDesc extends StatelessWidget {
  const _WeddingPlanDesc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 160),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 70),
              child: TopicText(headText: 'План мероприятия'),
            ),
            DefaultTextStyle(
              style: GoogleFonts.ptSansNarrow(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    padding: EdgeInsets.only(left: 78, right: 38),
                    child: SizedBox(
                      width: 11,
                      child: _DividerPlan(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 136),
                    child: _PlanColumn(
                      firstImg: 'assets/images/wedding-rings.png',
                      firstTitle: 'Регистрация\nбракосочетания\n15:00',
                      secondImg: 'assets/images/fireworks.png',
                      secondTitle: 'Завершение вечера\n22:00',
                    ),
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
class _PlanColumMobile extends StatelessWidget {
  final String img;
  final bool? line;
  final String title;

  const _PlanColumMobile({
    required this.img,
    this.line = true,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Image(
              image: AssetImage(img),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
          if (line ?? false)
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: CustomPaint(
                size: Size(
                    11,
                    (11 * 7.571428571428571)
                        .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: _SoloLine(),
              ),
            )
        ],
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
            fit: BoxFit.cover,
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
              fit: BoxFit.cover,
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
              child: TopicText(
                headText: 'Дорогие наши\nдрузья и родные!',
                bodyText: 'Вы получили эту ссылку,\n'
                    'а значит, мы спешим сообщить\n'
                    'вам важную новость!',
              ),
            ),
            const TopicText(
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
                  image: AssetImage('assets/images/calendar(1).png'),
                  width: 252,
                  height: 201,
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
class _SendButton extends StatefulWidget {
  final ValueNotifier<List<int>> select;

  const _SendButton({
    required this.select,
    Key? key,
  }) : super(key: key);

  @override
  State<_SendButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<_SendButton> {
  late ValueNotifier<bool> _active;

  @override
  void initState() {
    super.initState();
    _active = ValueNotifier(true);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        bottom: 165,
      ),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
          ],
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(0, 209, 255, 1),
              Color.fromRGBO(103, 178, 101, 1),
            ],
          ),
        ),
        child: AnimatedBuilder(
          animation: _active,
          builder: (context, _) => _active.value
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    shape: const RoundedRectangleBorder(),
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 63,
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () async {
                    // _active.value = false;
                  },
                  child: Text(
                    'Отправить',
                    style: GoogleFonts.ptSansNarrow(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class _SoloLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = const Color(0xff101010).withOpacity(1.0);
    canvas.drawRect(
        Rect.fromLTWH(size.width * 0.4000000, 0, size.width * 0.2000000,
            size.height * 0.9433962),
        paint_0_fill);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = const Color(0xff101010).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.5000000, size.height * 0.9528302),
        size.width * 0.5000000, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
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
