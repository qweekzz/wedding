import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wedding/core/extension/extension.dart';

//Дата свадьбы
final weddingDate = DateTime(2023, 8, 17, 14).toLocal();

@immutable
class WeddingTimer extends StatefulWidget {
  const WeddingTimer({
    Key? key,
  }) : super(key: key);

  @override
  State<WeddingTimer> createState() => _WeddingTimerState();
}

class _WeddingTimerState extends State<WeddingTimer> {
  //таймер на 1 сек
  late final Timer? _timer;

  //Кол-во дней до сводьбы
  late final ValueNotifier<Duration> _weddingTimer;

  @override
  void initState() {
    super.initState();

    final dateNow = DateTime.now().toLocal();
    final differenceDate = weddingDate.difference(dateNow);

    final dur = Duration(seconds: differenceDate.inSeconds);
    _weddingTimer = ValueNotifier<Duration>(dur);

    // таймер времени до свадьбы (отнемает 1 сек от даты свадьбы)
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) => _weddingTimer.value -= const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _weddingTimer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          _WeddingTimerRow(
            weddingTimer: _weddingTimer,
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
  final ValueNotifier<Duration> weddingTimer;
  final DateTime weddingDate;

  const _WeddingTimerRow({
    required this.weddingTimer,
    required this.weddingDate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 18, bottom: 40),
        child: ValueListenableBuilder<Duration>(
          valueListenable: weddingTimer,
          builder: (context, timer, _) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: _TimerColumn(
                  title: 'ДНЕЙ',
                  weddingTimer: timer.inDaysRest,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: _TimerColumn(
                  title: 'ЧАСОВ',
                  weddingTimer: timer.inHoursRest,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: _TimerColumn(
                  title: 'МИНУТ',
                  weddingTimer: timer.inMinutesRest,
                ),
              ),
              _TimerColumn(
                title: 'СЕКУНД',
                weddingTimer: timer.inSecondsRest,
              ),
            ],
          ),
        ),
      );
}
