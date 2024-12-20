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

  String convertToBuddhistDate(DateTime date) {
    int buddhistYear = date.year + 543;
    return "${date.day}-${date.month}-$buddhistYear";
  }

  void _showDetailsDialog(BuildContext context, DateTime date) {
    final details = startEndDetails[date];
    if (details == null) return;
    Books _book = (details['book']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Details (${details['type'] == 'Start Date' ? 'วันที่เริ่มต้น' : 'วันที่สิ้นสุด'})"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  Text(
                    "code: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${_book.order!.code}",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Wrap(
                children: [
                  Text(
                    "วัตถุประสงค์: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${_book.order!.request_purpose}",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Wrap(
                children: [
                  Text(
                    "รุ่น: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${_book.order!.current_machine_model}",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Wrap(
                children: [
                  Text(
                    "รุ่นคู่แข่ง: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${_book.order!.competitor_model}",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Wrap(
                children: [
                  Text(
                    "การประชุม: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${_book.order!.meeting_details}",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Wrap(
                children: [
                  Text(
                    "สถานีทำงาน: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${_book.order!.current_work_station}",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Wrap(
                children: [
                  Text(
                    "ตัวแปลงสัญญาณของคู่แข่ง: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${_book.order!.competitor_transducer}",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Wrap(
                children: [
                  Text(
                    "คำติชมจากลูกค้า: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${_book.order!.customer_feedback}",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Wrap(
                children: [
                  Text(
                    "ข้อมูลเพิ่มเติม: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${_book.order!.additional_info}",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Wrap(
                children: [
                  Text(
                    "ชื่อคุณหมอ: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${_book.order!.kol_doctor}",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Wrap(
                children: [
                  Text(
                    "จังหวัด: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${_book.order!.province}",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Wrap(
                children: [
                  Text(
                    "แผนก: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${_book.order!.department}",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Wrap(
                children: [
                  Text(
                    "วันที่เริ่มต้น: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    convertToBuddhistDate(DateTime.parse(_book.order!.start_date!)),
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Wrap(
                children: [
                  Text(
                    "วันที่สิ้นสุด: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    convertToBuddhistDate(DateTime.parse(_book.order!.end_date!)),
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    Color(0xff3c61a9),
                  ),
                  // padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.all(13)),
                  // foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ))),
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "Close",
                style: TextStyle(color: Colors.white),
              ),
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
