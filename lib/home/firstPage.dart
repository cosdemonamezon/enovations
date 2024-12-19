import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:novations/constants.dart';
import 'package:novations/home/homePage.dart';
import 'package:novations/notifications/notiPage.dart';
import 'package:novations/products/productPage.dart';
import 'package:novations/setting/settingPage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int selectedIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentPage = HomePage();

  void onItemSelect(int index) {
    setState(() {
      selectedIndex = index;
      if (selectedIndex == 0) {
        currentPage = HomePage();
      } else if (selectedIndex == 1) {
        currentPage = ProductPage();
      } else if (selectedIndex == 2) {
        currentPage = NotiPage();
      } else if (selectedIndex == 3) {
        currentPage = SettingPage();
      }  
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: PageStorage(bucket: bucket, child: currentPage),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: bluebackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 5,
                activeColor: bluebackground,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
                tabs: [
                  GButton(
                    icon: Icons.home,
                    iconColor: Colors.white,
                    text: 'หน้าแรก',
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  GButton(
                    icon: Icons.production_quantity_limits,
                    iconColor: Colors.white,
                    text: 'สินค้า',
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  GButton(
                    icon: Icons.notifications,
                    iconColor: Colors.white,
                    text: 'แจ้งเตือน',
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  GButton(
                    icon: Icons.settings,
                    iconColor: Colors.white,
                    text: 'ตั้งค่า',
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ],
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  onItemSelect(index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}