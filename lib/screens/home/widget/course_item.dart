import 'package:course_app/constants/colors.dart';
import 'package:course_app/models/course.dart';
import 'package:course_app/screens/detail/detail.dart';
import 'package:flutter/material.dart';

import '../../../constants/fonts.dart';

class CourseItem extends StatelessWidget {
  final Course course;
  CourseItem(this.course);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
                color: kBackground2, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Image.asset(course.imageUrl, fit: BoxFit.cover)),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(course.authorImg, width: 20),
                            SizedBox(width: 5),
                            Text(
                              course.author,
                              style: smallHeaderStyle,
                            )
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              course.title,
                              style: smallHeaderStyle,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: kFontLight, shape: BoxShape.circle),
                            ),
                            Text(
                              '2h 22min',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: kFontLight),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 60,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: kAccent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailPage(course)));
              },
              child: Text('Start' , style: smallHeaderStyleWhite,),
            ),
          )
        ],
      ),
    );
  }
}
