import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class TimeLineWidget extends StatefulWidget {
  @override
  State<TimeLineWidget> createState() => _TimeLineWidgetState();
}

class _TimeLineWidgetState extends State<TimeLineWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {},
      activeColor: const Color(0xff58CCA2),
      headerProps: const EasyHeaderProps(
        showHeader: true,
        centerHeader: false,
        showSelectedDate: false,
        monthPickerType: MonthPickerType.dropDown,
        monthStyle: TextStyle(
          color: Colors.grey,
          fontSize: 26,
        ),
      ),
      timeLineProps: const EasyTimeLineProps(
        margin: EdgeInsets.only(bottom: 50, left: 5, right: 5),
        hPadding: 50.0, // padding from left and right
        separatorPadding: 16.0, // padding between days
        vPadding: 27.0,
      ),
      dayProps: const EasyDayProps(
          width: 100,
          height: 150,
          dayStructure: DayStructure.dayNumDayStr,
          inactiveDayStyle: DayStyle(
            borderRadius: 48.0,
            dayNumStyle: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
          activeDayStyle: DayStyle(
            dayNumStyle: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          todayStyle: DayStyle(
            dayNumStyle: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          )),
    );
  }
}
