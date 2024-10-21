import 'package:e_learning/screens/home/widget/category_course_list.dart';
import 'package:e_learning/screens/home/widget/category_list.dart';
import 'package:e_learning/screens/home/widget/course_list.dart';
import 'package:e_learning/screens/home/widget/course_search.dart';
import 'package:e_learning/screens/home/widget/featured_courses.dart';
import 'package:e_learning/screens/home/widget/header.dart';
import 'package:e_learning/screens/home/widget/offers.dart';
import 'package:e_learning/shared/components/bottom_option.dart';
import 'package:e_learning/shared/components/constants.dart';
import 'package:e_learning/shared/components/shopping_cart_option.dart';
import 'package:flutter/material.dart';

class CourseHome extends StatelessWidget {
  const CourseHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
                Container(
                    height: 170,
                    decoration: const BoxDecoration(
                      color:  kPrimaryColor ,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                    )
                    ,child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10,),
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 10,
                        ),
                        Header(),
                        SizedBox(
                          height: 10,
                        ),
                        CourseSearch(),
                      ],
                    ),)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Offers(),
                     //const
                    FeaturedCourses(),
                    const CategoryCourseList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ShoppingCartOption(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomOption(selectedIndex: 1,),
    );
  }
}
