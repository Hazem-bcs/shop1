import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLineWidget extends StatelessWidget {
  const TimeLineWidget({
    super.key,
    required this.title,
    required this.text,
    required this.time,
    required this.context,
    required this.done,
    this.isFirst = false,
    this.isLast = false,

  });
  final String title;
  final String text;
  final String time;
  final BuildContext context;
  final bool done;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
      return AnimatedOpacity(
        duration: const Duration(seconds: 4),
        opacity: 1,
        child: TimelineTile(
          alignment: TimelineAlign.start,
          isFirst: isFirst,
          isLast: isLast,
          indicatorStyle: IndicatorStyle(
            width: 40,
            color: done ? Theme.of(context).colorScheme.primary : Colors.grey,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            iconStyle: IconStyle(
              color: Colors.white,
              iconData: Icons.check,
            ),
          ),
          endChild: Container(
            margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.04),
            height: MediaQuery.sizeOf(context).height * 0.12,
            child: ListTile(
              title: Text(title),
              subtitle: Text(text),
              trailing: Text(time),
            ),
          ),
          beforeLineStyle: LineStyle(
            color: done ? Theme.of(context).colorScheme.primary : Colors.grey,
          ),
          afterLineStyle: LineStyle(
            color: done ? Theme.of(context).colorScheme.primary : Colors.grey,
          ),
        ),
      );
  }
}
