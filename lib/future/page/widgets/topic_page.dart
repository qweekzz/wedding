import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class TopicText extends StatelessWidget {
  final String headText;
  final String? bodyText;

  const TopicText({
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
