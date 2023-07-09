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
  Widget build(BuildContext context) => Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 533),
                    child: const _MainStack(),
                  ),
                  //текст
                  //текст
                  //текст
                ],
              ),
            ],
          )
          // текст обалака
          // календарь и полосы
          //план мероприятий
        ],
      );
}

List<Widget> listWidgets(BuildContext context) {
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
      top: 6,
      right: 0,
      child: Image.asset('assets/images/fw2.png'),
    ),
    Positioned(
      top: 822,
      right: 0,
      child: Image.asset('assets/images/fw2.png'),
    ),
    Positioned(
      top: MediaQuery.of(context).size.width > 500 ? 2055 : 2646,
      right: 0,
      child: Image.asset('assets/images/fw2.png'),
    ),
    Positioned(
      top: MediaQuery.of(context).size.width > 500 ? 2804 : 3300,
      right: 0,
      child: Image.asset('assets/images/fw2.png'),
    ),
    Positioned(
      top: MediaQuery.of(context).size.width > 500 ? 3403 : 3864,
      right: 0,
      child: Image.asset('assets/images/fw2.png'),
    ),
    const Positioned(
      top: 353,
      left: 0,
      child: Image(
        width: 100,
        fit: BoxFit.cover,
        image: AssetImage('assets/images/fw1.png'),
      ),
    ),
    Positioned(
      top: 353,
      left: 0,
      child: Image.asset('assets/images/fw1.png'),
    ),
    Positioned(
      top: MediaQuery.of(context).size.width > 500 ? 1582 : 1734,
      left: 0,
      child: Image.asset('assets/images/fw1.png'),
    ),
    Positioned(
      top: MediaQuery.of(context).size.width > 500 ? 2608 : 3169,
      left: 0,
      child: const Image(
        image: AssetImage('assets/images/fw1.png'),
      ),
    ),
    Positioned(
      top: MediaQuery.of(context).size.width > 500 ? 3403 : 3823,
      left: 0,
      child: Image.asset('assets/images/fw1.png'),
    ),
    MediaQuery.of(context).size.width > 500
        ? const Positioned(
            bottom: 255,
            left: 0,
            child: Image(
              width: 100,
              fit: BoxFit.cover,
              image: AssetImage('assets/images/fw1.png'),
            ),
          )
        : const Positioned(
            bottom: 255,
            right: 0,
            child: Image(
              width: 75,
              fit: BoxFit.cover,
              image: AssetImage('assets/images/fw2.png'),
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
              const _SendButton(),
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
                  ),
                  _PlanColumMobile(
                    img: 'assets/images/wedding-rings.png',
                  ),
                  _PlanColumMobile(
                    img: 'assets/images/wine.png',
                  ),
                  _PlanColumMobile(
                    img: 'assets/images/fireworks.png',
                    line: false,
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
                      firstTitle: 'Регистрация бракосочетания\n15:00',
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

  const _PlanColumMobile({
    required this.img,
    this.line = true,
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
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              'Сбор гостей\n 14:30',
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
class _SendButton extends StatelessWidget {
  const _SendButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
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
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              shape: const RoundedRectangleBorder(),
              padding: const EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 63,
              ),
              backgroundColor: Colors.transparent,
            ),
            onPressed: () {},
            child: const Text(
              'Отправить',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                height: 1,
              ),
            ),
          ),
        ),
      );
}

//Copy this CustomPainter code to the Bottom of the File
class _SoloLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff101010).withOpacity(1.0);
    canvas.drawRect(
        Rect.fromLTWH(size.width * 0.4000000, 0, size.width * 0.2000000,
            size.height * 0.9433962),
        paint_0_fill);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xff101010).withOpacity(1.0);
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
