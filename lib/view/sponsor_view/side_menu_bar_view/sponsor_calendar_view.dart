import 'package:flutter/material.dart';
import 'package:radigone_v3/resources/colors.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../resources/components/background_designs.dart';
import '../../../resources/components/custom_header.dart';

class SponsorCalendarView extends StatefulWidget {
  const SponsorCalendarView({super.key});

  @override
  State<SponsorCalendarView> createState() => _SponsorCalendarViewState();
}

class _SponsorCalendarViewState extends State<SponsorCalendarView> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Stack(
      children: [
        const LowerBackgroundDesign(),
        const UpperBackgroundDesign(),
        CustomHeaderWithBackButton(
          title: "Calendar",
        ),
        Container(
            // height: double.infinity,
            // width: double.infinity,
            margin: const EdgeInsets.only(top: 180, bottom: 10),
            padding: const EdgeInsets.only(left: 20, right: 20),
            alignment: Alignment.center,
            child: Column(
              children: [
                Material(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                  child: TableCalendar(
                      locale: 'en_US',
                      headerStyle: const HeaderStyle(
                          formatButtonVisible: false, titleCentered: true),
                      selectedDayPredicate: (day) => isSameDay(day, today),
                      availableGestures: AvailableGestures.all,
                      focusedDay: today,
                      firstDay: DateTime.utc(1950, 01, 01),
                      lastDay: DateTime.utc(2099, 12, 31),
                      onDaySelected: _onDaySelected,
                      calendarStyle: CalendarStyle(
                        defaultTextStyle: const TextStyle(color: Colors.white),
                        weekendTextStyle: const TextStyle(color: Colors.red),
                        tableBorder: TableBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        selectedDecoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                        todayDecoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.green),
                        todayTextStyle: const TextStyle(color: Colors.white),
                        withinRangeTextStyle: const TextStyle(color: Colors.white),
                        weekNumberTextStyle:
                            const TextStyle(color: Colors.white),
                        rangeStartTextStyle:
                            const TextStyle(color: Colors.white),
                        outsideDaysVisible: true,
                        outsideTextStyle:
                            const TextStyle(color: Colors.white30),
                        rangeHighlightColor: Colors.white,
                      )),
                ),
              ],
            ))
      ],
    );
  }
}
