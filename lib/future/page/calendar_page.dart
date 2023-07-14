// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:rive/rive.dart' as rive;
import 'package:wedding/core/date_base/date_base.dart';
import 'package:wedding/future/page/dress_code.dart';
import 'package:wedding/future/page/drink_page.dart';
import 'package:wedding/future/page/wedding_place.dart';
import 'package:wedding/future/page/wishes.dart';

import 'widgets/widgets.dart';

@immutable
class CalendarPage extends StatelessWidget {
  final ValueNotifier<bool> heartAnimate;

  const CalendarPage({
    required this.heartAnimate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 533),
        child: _MainStack(
          heartAnimate: heartAnimate,
        ),
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
  final ValueNotifier<bool> heartAnimate;

  const _MainStack({
    required this.heartAnimate,
    Key? key,
  }) : super(key: key);

  @override
  State<_MainStack> createState() => _MainStackState();
}

class _MainStackState extends State<_MainStack> {
  late final ValueNotifier<List<int>> _select;
  late final ValueNotifier<bool> _active;

  @override
  void initState() {
    super.initState();
    _select = ValueNotifier([]);
    _active = ValueNotifier(true);
  }

  @override
  void dispose() {
    _select.dispose();
    _active.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.center,
        children: [
          ...listWidgets(context),
          Column(
            children: [
              _CalendarAndFlowers(
                heartAnimate: widget.heartAnimate,
              ),
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
                title: 'Подтвердить',
                active: _active,
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
class _CalendarAndFlowers extends StatefulWidget {
  final ValueNotifier<bool> heartAnimate;

  const _CalendarAndFlowers({
    required this.heartAnimate,
    Key? key,
  }) : super(key: key);

  @override
  State<_CalendarAndFlowers> createState() => _CalendarAndFlowersState();
}

class _CalendarAndFlowersState extends State<_CalendarAndFlowers> {
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
            Stack(
              children: [
                Image(
                  image: AssetImage('assets/images/calendar(1).png'),
                  width: 252,
                  height: 201,
                ),
                AnimatedBuilder(
                  animation: widget.heartAnimate,
                  builder: (context, _) => widget.heartAnimate.value
                      ? const Positioned(
                          height: 250,
                          width: 250,
                          top: 2,
                          left: 34,
                          child: rive.RiveAnimation.asset(
                            'assets/rive/new_file.riv',
                            fit: BoxFit.cover,
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ],
        ),
      );
}

@immutable
class _SendButton extends StatefulWidget {
  final ValueNotifier<bool> active;
  final ValueNotifier<List<int>>? select;
  final String title;

  const _SendButton({
    required this.title,
    required this.active,
    this.select,
    Key? key,
  }) : super(key: key);

  @override
  State<_SendButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<_SendButton> {
  late final TextEditingController _nameController;
  late final TextEditingController _surnameController;

  @override
  void initState() {
    super.initState();
    _surnameController = TextEditingController();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _surnameController.dispose();
    _nameController.dispose();
    super.dispose();
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
          animation: widget.active,
          builder: (context, _) => widget.active.value
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

  Future<void> _showNameSheet() async {
    showBarModalBottomSheet(
      context: context,
      builder: (context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (MediaQuery.of(context).size.width > 535)
            Expanded(
              child: Container(
                height: 300,
                color: Colors.black38,
              ),
            ),
          MediaQuery.of(context).size.width > 535
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _TextField(
                          title: 'Имя',
                          controller: _nameController,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: _TextField(
                            title: 'Фамилия',
                            controller: _surnameController,
                          ),
                        ),
                        _ModalButton(
                          select: widget.select,
                          nameController: _nameController,
                          surnameController: _surnameController,
                          active: widget.active,
                        ),
                      ],
                    ),
                  ),
                )
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: _TextField(
                            title: 'Имя',
                            controller: _nameController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: _TextField(
                            title: 'Фамилия',
                            controller: _surnameController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: _ModalButton(
                            select: widget.select,
                            nameController: _nameController,
                            surnameController: _surnameController,
                            active: widget.active,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          if (MediaQuery.of(context).size.width > 535)
            Expanded(
              child: Container(
                height: 300,
                color: Colors.black38,
              ),
            ),
        ],
      ),
    );
  }
}

@immutable
class _ModalButton extends StatelessWidget {
  final ValueNotifier<List<int>>? select;
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final ValueNotifier<bool> active;

  const _ModalButton({
    required this.select,
    required this.nameController,
    required this.surnameController,
    required this.active,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => DecoratedBox(
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
          onPressed: () async {
            DateBase().addName(
              nameController.text,
              surnameController.text,
              select?.value,
            );
            active.value = false;
            Navigator.pop(context);
          },
          child: Text(
            'Отпарвить',
            style: GoogleFonts.ptSansNarrow(
              color: Colors.white,
              fontSize: 20,
              height: 1,
            ),
          ),
        ),
      );
}

@immutable
class _TextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;

  const _TextField({
    required this.controller,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
          labelStyle: const TextStyle(
            fontSize: 14,
          ),
          isCollapsed: true,
          contentPadding: const EdgeInsets.fromLTRB(8, 14, 8, 14),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
        ),
      );
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
