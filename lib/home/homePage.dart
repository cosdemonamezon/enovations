import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:novations/constants.dart';
import 'package:novations/home/widgets/CardContentWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Colors.white),),
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


