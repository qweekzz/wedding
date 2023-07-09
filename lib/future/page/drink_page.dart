import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding/future/page/widgets/topic_page.dart';

@immutable
class DrinkPage extends StatelessWidget {
  final ValueNotifier<List<int>> select;

  const DrinkPage({
    required this.select,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TopicText(
              headText: 'Пожалуйста, уточните ваши\nпредпочтения в алкоголе:',
            ),
            DefaultTextStyle(
              style: GoogleFonts.ptSansNarrow(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: AnimatedBuilder(
                  animation: select,
                  builder: (context, _) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _DrinkSelector(
                        index: 1,
                        select: select,
                        title: 'Вино красное',

                        // onTap: () {},
                      ),
                      _DrinkSelector(
                        index: 2,
                        select: select,
                        title: 'Вино белое',
                      ),
                      _DrinkSelector(
                        index: 3,
                        select: select,
                        title: 'Водка',
                      ),
                      _DrinkSelector(
                        index: 4,
                        select: select,
                        title: 'Коньяк',
                      ),
                      _DrinkSelector(
                        index: 5,
                        select: select,
                        title: 'Настойки',
                      ),
                      _DrinkSelector(
                        index: 6,
                        select: select,
                        title: 'Безалкогольные напитки',
                      ),
                      _DrinkSelector(
                        index: 7,
                        select: select,
                        title: 'Я ПЬЮ ВСЁ',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

@immutable
class _DrinkSelector extends StatelessWidget {
  final String title;
  final int index;
  final ValueNotifier<List<int>> select;
  // final VoidCallback onTap;
  // final bool checked;

  const _DrinkSelector({
    required this.title,
    required this.select,
    required this.index,
    // required this.onTap,
    // required this.checked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 325),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                value: select.value.contains(index),
                onChanged: (value) {
                  if (select.value.any((element) => element == index)) {
                    select.value = List.from(select.value)
                      ..removeWhere((element) => element == index);
                  } else {
                    select.value = List.from(select.value)..add(index);
                  }
                  print(select.value);
                },
              ),
              Text(title),
            ],
          ),
        ),
      );
}
