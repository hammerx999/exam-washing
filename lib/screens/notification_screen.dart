import 'package:exam_dudee/screens/check_screen.dart';
import 'package:exam_dudee/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final finish = TimeOfDay.now();
    final Stream<QuerySnapshot> _noti =
        FirebaseFirestore.instance.collection('washs').snapshots();
    return Container(
        decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage("assets/images/bg.png"),
      fit: BoxFit.cover,
    ),
  ),
      child: Scaffold(
      backgroundColor: Colors.transparent,
      body: StreamBuilder(
        stream: _noti,
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> streamSnapshoot) {
          if (streamSnapshoot.hasError) {
            return Text('Something went wrong');
          }

          if (streamSnapshoot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          } else {
            return ListView(
              children:
                  streamSnapshoot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Column(
                  children: [
                    Container(
                        width: double.infinity,
                        child: data['notification'] == true
                            ? GestureDetector(
                                onTap: () {
                                  Get.to(HomeScreen(), arguments: 0);
                                },
                                child: ListTile(
                                  leading: CircleAvatar(
                  
                                    backgroundImage:
                                        AssetImage('assets/images/icon.png',),
                                  ),
                                  title: Text(
                                    '${data['number']} just finished work  ',
                                    style: TextStyle(fontFamily: 'fonts1',fontSize: 20),
                                  ),
                                  subtitle: Text(data['finish'].toString(),
                                      style: TextStyle(fontFamily: 'fonts1',fontSize: 16)),
                                ),
                              )
                            : null ),
                   
                 data['notification'] == true ?   
                 Container(height: 1,
                 color: Colors.black,
                 width: MediaQuery.of(context).size.width * 0.80,)
                  : Container(),
                  ],
                );
              }).toList(),
            );
          }
        },
      ),
    )
    );
  }
}
