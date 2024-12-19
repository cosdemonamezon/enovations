import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:novations/models/books.dart';

class BookCalendar extends StatefulWidget {
  BookCalendar({super.key, required this.books});
  List<Books> books;

  @override
  State<BookCalendar> createState() => _BookCalendarState();
}

class _BookCalendarState extends State<BookCalendar> {
  late EventList<Event> _markedDateMap;
  final Map<DateTime, bool> rangeDates = {};
  final Map<DateTime, bool> startEndDates = {};
  final Map<DateTime, Map<String, dynamic>> startEndDetails = {};
  Books? book;

  @override
  void initState() {
    super.initState();
    _markedDateMap = EventList<Event>(events: {});
    _processDates();
  }

  // void _processDates() {
  //   for (var item in widget.books) {
  //     DateTime startDate = DateTime.parse(item.start_date!);
  //     DateTime endDate = DateTime.parse(item.end_date!);
  //     startEndDates[startDate] = true;
  //     startEndDates[endDate] = true;

  //     // Add all dates between start and end
  //     for (int i = 1; i < endDate.difference(startDate).inDays; i++) {
  //       DateTime middleDate = startDate.add(Duration(days: i));
  //       rangeDates[middleDate] = true;
  //     }
  //   }
  // }

  void _processDates() {
    for (var item in widget.books) {
      DateTime startDate = DateTime.parse(item.start_date!);
      DateTime endDate = DateTime.parse(item.end_date!);
      startEndDates[startDate] = true;
      startEndDates[endDate] = true;
      startEndDetails[startDate] = {"book": item, "type": "Start Date"};
      startEndDetails[endDate] = {"book": item, "type": "End Date"};

      // Add all dates between start and end
      for (int i = 1; i < endDate.difference(startDate).inDays; i++) {
        DateTime middleDate = startDate.add(Duration(days: i));
        rangeDates[middleDate] = true;
      }
    }
  }

  void _showDetailsDialog(BuildContext context, DateTime date) {
    final details = startEndDetails[date];
    if (details == null) return;
    Books _book = (details['book']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Details (${details['type']})"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("code: ${_book.order!.code}"),
              Text("Request Purpose: ${_book.order!.request_purpose}"),
              Text("Machine Model: ${_book.order!.current_machine_model}"),
              Text("Name Doctor: ${_book.order!.kol_doctor}"),
              Text("Competitor Model: ${_book.order!.competitor_model}"),
              Text("Province: ${_book.order!.province}"),
              Text("Department: ${_book.order!.department}"),
              Text("Start Date: ${_book.order!.start_date}"),
              Text("End Date: ${_book.order!.end_date}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'วันที่จอง',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff3c61a9),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              height: size.height * 0.45,
              child: CalendarCarousel<Event>(
                markedDateShowIcon: false,
                customDayBuilder: (
                  bool isSelectable,
                  int index,
                  bool isSelectedDay,
                  bool isToday,
                  bool isPrevMonthDay,
                  TextStyle textStyle,
                  bool isNextMonthDay,
                  bool isThisMonthDay,
                  DateTime day,
                ) {
                  // Highlight startDate and endDate as dots
                  if (startEndDates[day] == true) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 8.0,
                            width: 8.0,
                            decoration: BoxDecoration(
                              color: startEndDetails[day]!['type'] == "Start Date" ? Colors.green : Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            '${day.day}',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  }

                  // Add dashes between startDate and endDate
                  if (rangeDates[day] == true) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 2.0,
                            width: 16.0,
                            color: Colors.grey,
                          ),
                          Text(
                            '${day.day}',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  }

                  // Default day rendering
                  return null;
                },
                todayButtonColor: Colors.transparent,
                todayTextStyle: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                daysTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                weekendTextStyle: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                onDayPressed: (date, events) {
                  // Check if the day is startDate or endDate and show dialog
                  if (startEndDetails.containsKey(date)) {
                    _showDetailsDialog(context, date);
                  }
                  //inspect(events);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
