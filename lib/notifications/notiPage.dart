import 'package:flutter/material.dart';

class NotiPage extends StatefulWidget {
  const NotiPage({super.key});

  @override
  State<NotiPage> createState() => _NotiPageState();
}

class _NotiPageState extends State<NotiPage> {
  final List<Map<String, String>> notifications = [
    {"title": "New Order Received", "message": "Order #12345 has been placed.", "time": "10 mins ago"},
    {"title": "Stock Alert", "message": "Low stock for X-Ray Machine.", "time": "30 mins ago"},
    {"title": "Delivery Update", "message": "Order #12344 has been shipped.", "time": "1 hour ago"},
    {"title": "Payment Received", "message": "Payment for Order #12343 confirmed.", "time": "2 hours ago"},
    {"title": "New Product Added", "message": "Ultrasound Gel is now available.", "time": "4 hours ago"},
    {"title": "System Maintenance", "message": "Scheduled maintenance at 2 AM.", "time": "Yesterday"},
    {"title": "Promotional Offer", "message": "20% off on Defibrillators.", "time": "2 days ago"},
    {"title": "Customer Feedback", "message": "Feedback received for Order #12341.", "time": "3 days ago"},
    {"title": "Account Update", "message": "Your account has been updated.", "time": "Last week"},
    {"title": "Reminder", "message": "Renew your subscription.", "time": "Last week"},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
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
            ListView.builder(
              itemCount: notifications.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      notification['title']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff3c61a9),
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(notification['message']!),
                        SizedBox(height: 4),
                        Text(
                          notification['time']!,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    leading: Icon(Icons.notifications, color: Color(0xff3c61a9)),
                    onTap: () {},
                  ),
                );
              },
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
