import 'dart:async';

import 'package:flutter/material.dart';

@immutable
class WeddingTimer extends StatefulWidget {
  const WeddingTimer({
    Key? key,
  }) : super(key: key);

  @override
  State<WeddingTimer> createState() => _WeddingTimerState();
}

class _WeddingTimerState extends State<WeddingTimer> {
  Timer? timer;

  //Дата свадьбы
  DateTime weddingDate = DateTime.utc(2023, 8, 17, 14);

  // это хз как убрать
  int month = DateTime.now().month;
  int day = DateTime.now().day;
  int hours = DateTime.now().hour;
  int minute = DateTime.now().minute;
  int second = DateTime.now().second;

  late DateTime weddingTimer;

  @override
  void initState() {
    super.initState();
    if (weddingDate.month > DateTime.now().month) {
      day = day + 31;
    }
    //рассчет времени от данного момента до свадьбы
    weddingTimer = weddingDate.subtract(Duration(
      days: day,
      hours: hours,
      minutes: minute,
      seconds: second,
    ));

    // таймер времени до свадьбы
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          weddingTimer = weddingTimer.subtract(
            const Duration(seconds: 1),
          );
        });
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          _WeddingTimerRow(
            weddingTimer: weddingTimer,
            weddingDate: weddingDate,
          )
        ],
      );
}

@immutable
class _TimerColumn extends StatelessWidget {
  final int weddingTimer;
  final String title;

  const _TimerColumn({
    required this.weddingTimer,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text(
            '$weddingTimer',
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      );
}

@immutable
class _WeddingTimerRow extends StatelessWidget {
  final DateTime weddingTimer;
  final DateTime weddingDate;

  const _WeddingTimerRow({
    required this.weddingTimer,
    required this.weddingDate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 18, bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: _TimerColumn(
                title: 'ДНЕЙ',
                weddingTimer: weddingDate.month > DateTime.now().month
                    ? weddingTimer.day + 31
                    : weddingTimer.day,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: _TimerColumn(
                title: 'ЧАСОВ',
                weddingTimer: weddingTimer.hour,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: _TimerColumn(
                title: 'МИНУТ',
                weddingTimer: weddingTimer.minute,
              ),
            ),
            _TimerColumn(
              title: 'СЕКУНД',
              weddingTimer: weddingTimer.second,
            ),
          ],
        ),
      );
}
