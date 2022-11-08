import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomePageScreen extends StatefulWidget {
  HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 47, 149, 162),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'Promotion Today!',
                          style: TextStyle(
                              fontFamily: 'fonts1',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: ImageSlideshow(
                          width: double.infinity,
                          height: 200,
                          initialPage: 0,
                          indicatorColor: Colors.purple,
                          indicatorBackgroundColor: Colors.grey,
                          children: [
                            Image.asset(
                              'assets/images/image02.jpg',
                              fit: BoxFit.fill,
                            ),
                            Image.asset(
                              'assets/images/image03.jpg',
                              fit: BoxFit.fill,
                            ),
                            Image.asset(
                              'assets/images/image04.jpg',
                              fit: BoxFit.cover,
                            ),
                          ],
                          autoPlayInterval: 3000,
                          isLoop: true,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(" What's new today ?",
                          style: TextStyle(
                              fontFamily: 'fonts1',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 35, 68, 81))),
                      Container(
                          padding: EdgeInsets.all(12),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Color.fromARGB(142, 0, 183, 255),
                          ),
                          child: Image.asset('assets/images/image05.png'))
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
