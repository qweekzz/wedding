import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding/core/date_base/date_base.dart';
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
          mainAxisSize: MainAxisSize.min,
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
                  builder: (context, _) {
                    return SizedBox(
                      width: 320,
                      child: FutureBuilder(
                        future: DateBase().getDrink(),
                        builder: (context, snapshot) {
                          final Map<String, dynamic>? data =
                              snapshot.data?.data();
                          return snapshot.data != null
                              ? ListView.builder(
                                  itemCount: data?.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      _DrinkSelector(
                                    title: data?['$index']['title'] ?? '',
                                    select: select,
                                    index: index,
                                  ),
                                )
                              : const SizedBox.shrink();
                        },
                      ),
                    );
                  },
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

  const _DrinkSelector({
    required this.title,
    required this.select,
    required this.index,
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
                },
              ),
              Text(title),
            ],
          ),
        ),
      );
}
