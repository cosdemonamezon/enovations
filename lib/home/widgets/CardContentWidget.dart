import 'package:flutter/material.dart';

class CardContentWidget extends StatelessWidget {
  const CardContentWidget({super.key, required this.size, required this.content, required this.imageUrl, required this.title});

  final Size size;
  final String imageUrl;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        children: [
          Container(
            height: size.height * 0.16, // กำหนดความสูงของภาพ
            width: size.width * 0.65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Image.asset(
              '${imageUrl}',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            child: Column(
              children: [
                SizedBox(
                    width: size.width * 0.65,
                    child: Text(
                      '${title}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      maxLines: 2,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
