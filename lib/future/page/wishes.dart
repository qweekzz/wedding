import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding/future/page/widgets/widgets.dart';

import '../custom_paint/src/gradint_line.dart';

@immutable
class Wishes extends StatelessWidget {
  const Wishes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 330, bottom: 40),
            child: Transform.rotate(
              angle: 6.45,
              child: CustomPaint(
                size: Size(533, (30 * 0.11872909698996655).toDouble()),
                painter: GradientLine(),
              ),
            ),
          ),
          const TopicText(headText: 'Пожелания'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              'Будем благодарны , если\n'
              'вы воздержитесь от криков\n'
              '«Горько» на празднике,\n'
              'чтобы сохранить атмосферу уютного\n'
              'семейного праздника.',
              style: GoogleFonts.ptSansNarrow(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Будем ждать вас с радостью на нашей\n свадьбе. '
              'Поэтому просим вас, родные и\n'
              'близкие, подарите нам вместо цветов\n'
              'бутылочку вашего любимого алкогольного\n'
              'напитка, которую вы можете '
              'украсить\nсвоими пожеланиями.',
              style: GoogleFonts.ptSansNarrow(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Transform.rotate(
              angle: 0.01,
              child: CustomPaint(
                size: Size(533, (30 * 0.11872909698996655).toDouble()),
                painter: GradientLine(),
              ),
            ),
          ),
          Transform.rotate(
            angle: -6.43,
            child: CustomPaint(
              size: Size(533, (30 * 0.11872909698996655).toDouble()),
              painter: GradientLine(),
            ),
          ),
        ],
      );
}
