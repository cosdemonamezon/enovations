import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:novations/constants.dart';
import 'package:novations/home/widgets/CardContentWidget.dart';
import 'package:intl/intl.dart' show DateFormat;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  late EventList<Event> _markedDateMap;
  final Map<DateTime, bool> rangeDates = {};
  final Map<DateTime, bool> startEndDates = {};

  // Sample data
  final List<Map<String, dynamic>> data = [
    {
      "id": 6,
      "start_date": "2024-12-16",
      "end_date": "2024-12-20",
      "request_purpose": "Demo",
      "status": "Ordered",
    },
    {
      "id": 7,
      "start_date": "2024-12-01",
      "end_date": "2024-12-03",
      "request_purpose": "Demo",
      "status": "Ordered",
    },
  ];

  @override
  void initState() {
    super.initState();
    _markedDateMap = EventList<Event>(events: {});
    _processDates();
  }

  void _processDates() {
    for (var item in data) {
      DateTime startDate = DateTime.parse(item['start_date']);
      DateTime endDate = DateTime.parse(item['end_date']);
      startEndDates[startDate] = true;
      startEndDates[endDate] = true;

      // Add all dates between start and end
      for (int i = 1; i < endDate.difference(startDate).inDays; i++) {
        DateTime middleDate = startDate.add(Duration(days: i));
        rangeDates[middleDate] = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff3c61a9),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///ส่วนแสดงภาพสไลเดอร์/////////
            CarouselSlider(
              items: image_banner.map((imageUrl) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(1),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: size.height * 0.28,
                viewportFraction: 1.0,
                autoPlay: true,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            ////////////
            // SizedBox(
            //   height: size.height * 0.02,
            // ),
            // Container(
            //   height: size.height * 0.45,
            //   child: CalendarCarousel<Event>(
            //     markedDateShowIcon: false,
            //     customDayBuilder: (
            //       bool isSelectable,
            //       int index,
            //       bool isSelectedDay,
            //       bool isToday,
            //       bool isPrevMonthDay,
            //       TextStyle textStyle,
            //       bool isNextMonthDay,
            //       bool isThisMonthDay,
            //       DateTime day,
            //     ) {
            //       // Highlight startDate and endDate as dots
            //       if (startEndDates[day] == true) {
            //         return Center(
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Container(
            //                 height: 8.0,
            //                 width: 8.0,
            //                 decoration: BoxDecoration(
            //                   color: day == data[0]['start_date'] ? Colors.green : Colors.red,
            //                   shape: BoxShape.circle,
            //                 ),
            //               ),
            //               Text(
            //                 '${day.day}',
            //                 style: TextStyle(color: Colors.black),
            //               ),
            //             ],
            //           ),
            //         );
            //       }

            //       // Add dashes between startDate and endDate
            //       if (rangeDates[day] == true) {
            //         return Center(
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Container(
            //                 height: 2.0,
            //                 width: 16.0,
            //                 color: Colors.grey,
            //               ),
            //               Text(
            //                 '${day.day}',
            //                 style: TextStyle(color: Colors.black),
            //               ),
            //             ],
            //           ),
            //         );
            //       }

            //       // Default day rendering
            //       return null;
            //     },
            //     todayButtonColor: Colors.transparent,
            //     todayTextStyle: TextStyle(
            //       color: Colors.blue,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 16,
            //     ),
            //     daysTextStyle: TextStyle(
            //       color: Colors.black,
            //       fontSize: 16,
            //       fontWeight: FontWeight.w600,
            //     ),
            //     weekendTextStyle: TextStyle(
            //       color: Colors.red,
            //       fontSize: 16,
            //       fontWeight: FontWeight.w600,
            //     ),
            //   ),
            // ),

            //แสดงส่วหัวเรื่อง
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ข่าวสาร',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'แสดงทั้งหมด',
                    style: TextStyle(color: bluebackground),
                  )
                ],
              ),
            ),
            /////////
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              height: size.height * 0.265,
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    news.length,
                    (index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                          child: CardContentWidget(
                            size: size,
                            title: news[index]['title'],
                            content: news[index]['content'],
                            imageUrl: news[index]['imageUrl'],
                          ),
                        )),
              ),
            ),

            SizedBox(
              height: size.height * 0.02,
            ),

            ///แสดงส่วหัวเรื่อง
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ประกาศ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'แสดงทั้งหมด',
                    style: TextStyle(color: bluebackground),
                  )
                ],
              ),
            ),
            /////////
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              height: size.height * 0.265,
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    news.length,
                    (index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                          child: CardContentWidget(
                            size: size,
                            title: news[index]['title'],
                            content: news[index]['content'],
                            imageUrl: news[index]['imageUrl'],
                          ),
                        )),
              ),
            ),

            SizedBox(
              height: size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
