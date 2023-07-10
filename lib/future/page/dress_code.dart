import 'package:flutter/material.dart';
import 'package:wedding/future/page/widgets/widgets.dart';

import '../custom_paint/custom_paint.dart';

@immutable
class DressCode extends StatelessWidget {
  const DressCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 10),
              child: Transform.rotate(
                angle: -6.4,
                child: CustomPaint(
                  size: Size(533, (30 * 0.11872909698996655).toDouble()),
                  painter: GradientLine(),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 160),
              child: SizedBox(
                width: 320,
                child: TopicText(
                  headText: 'Дресс-код',
                  bodyText:
                      'Для нас главное - ваше присутствие. Но мы будем рады, если в своих нарядах вы поддержите цветовую гамму нашей свадьбы. (черный и белый)',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _Circle(
                    color: Colors.white,
                  ),
                  SizedBox(width: 15),
                  _Circle(
                    color: Colors.black,
                  ),
                ],
              ),
            )
          ],
        ),
      );
}

@immutable
class _Circle extends StatelessWidget {
  final Color color;

  const _Circle({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black),
          color: color,
        ),
        child: const SizedBox.square(
          dimension: 70,
        ),
      );
}
