import 'package:exam_dudee/screens/show_dialog_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class CheckScreen extends StatefulWidget {
  CheckScreen({Key? key}) : super(key: key);

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  DateTime timenow = DateTime.now();

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 3650;
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _roomsStream =
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
            body: Center(
      child: StreamBuilder<QuerySnapshot>(
          stream: _roomsStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return GridView.count(
              mainAxisSpacing: 40,
              crossAxisSpacing: 60,
              padding: EdgeInsets.all(30),
              crossAxisCount: 2,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return GestureDetector(
                    onTap: () {
                      print(endTime);
                      print(timenow.add(Duration(hours: 1)));
                      Get.dialog(ShowDialog(), arguments: data);
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/icon02.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 104, 186, 201)),
                          height: 100,
                          width: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  data['condition'] == true
                                      ? Icon(
                                          Icons.circle,
                                          color: Colors.red,
                                          size: 20,
                                        )
                                      : Icon(
                                          Icons.circle,
                                          color: Colors.green,
                                          size: 20,
                                        ),
                                  SizedBox(
                                    width: 2,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        // data['condition'] == true
                        //     ? Padding(
                        //         padding: EdgeInsets.fromLTRB(14, 8, 14, 0),
                        //         child: CountdownTimer(
                        //           endTime: endTime,
                        //           widgetBuilder: (_, time) {
                        //             if (time == null) {
                        //               return Text('finish');
                        //             }
                        //             return Row(
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.center,
                        //               children: [
                        //                 time.hours != null
                        //                     ? Text(
                        //                         '${time.hours}',
                        //                         style: TextStyle(fontSize: 14),
                        //                       )
                        //                     : Container(),
                        //                 Text(
                        //                   ':',
                        //                   style: TextStyle(fontSize: 14),
                        //                 ),
                        //                 time.min != null
                        //                     ? Text(
                        //                         '  ${time.min} ',
                        //                         style: TextStyle(fontSize: 14),
                        //                       )
                        //                     : Container(),
                        //                 Text(
                        //                   ':',
                        //                   style: TextStyle(fontSize: 14),
                        //                 ),
                        //                 time.sec != null
                        //                     ? Text(
                        //                         '${time.sec}',
                        //                         style: TextStyle(fontSize: 14),
                        //                       )
                        //                     : Container(),
                        //               ],
                        //             );
                        //           },
                        //         ),
                        //       )
                            // : Container()
                            // ,
                           
                      ],
                    ));
              }).toList(),
            );
          }),
    )));
  }
}
