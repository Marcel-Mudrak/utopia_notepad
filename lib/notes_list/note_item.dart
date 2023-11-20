import 'package:flutter/material.dart';

import 'package:utopia_recruitment_task/model/item/item.dart';

class NoteItem extends StatelessWidget {
  const NoteItem(this.note, {super.key});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 3,
        ),
        Card(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      style: Theme.of(context).textTheme.titleMedium,
                      note.title,
                    ),
                    Spacer(),
                    Text(
                      formatter.format(note.date),
                    )
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                        ),
                        note.description == null
                            ? ''
                            : note.description!.length > 27
                                ? note.description!.substring(0, 27) + '...'
                                : note.description!),
                    Spacer(),
                    Text(
                      formatterHour.format(
                        note.date,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
