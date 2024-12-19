import 'package:flutter/material.dart';

class PdpaInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy (PDPA)", style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xff3c61a9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Privacy Policy",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3c61a9),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "At eNovations, we are committed to protecting your personal data in compliance with the Personal Data Protection Act (PDPA). This policy explains how we collect, use, and safeguard your information.",
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 16),
              Text(
                "1. Data Collection",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "We collect personal information that you provide directly to us, such as your name, email address, phone number, and any other details necessary for delivering our services.",
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 16),
              Text(
                "2. Data Usage",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Your data is used to improve our services, process orders, and communicate important updates. We ensure that your information is not shared with third parties without your consent.",
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 16),
              Text(
                "3. Data Protection",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "We implement strict security measures to protect your personal data from unauthorized access, alteration, or disclosure.",
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 16),
              Text(
                "4. Your Rights",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "You have the right to access, update, and request the deletion of your personal data. To exercise these rights, please contact us at support@enovations.com.",
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 16),
              Text(
                "5. Contact Information",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "If you have any questions about this policy, please contact us at:",
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 8),
              Text(
                "Email: support@enovations.com\nPhone: +1 234 567 890",
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 32),
              Text(
                "Thank you for trusting eNovations with your data.",
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
