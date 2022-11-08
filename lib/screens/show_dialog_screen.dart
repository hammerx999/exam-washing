import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowDialog extends StatelessWidget {
  const ShowDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Column(
          children: [Row(
          children: [
            Text(Get.arguments['number'].toString(),
                style: TextStyle(fontFamily: 'fonts1', fontSize: 26)),
            Get.arguments['condition'] == true
                ? Text(
                    '(active now)',
                    style: TextStyle(
                        fontFamily: 'fonts1', fontSize: 20, color: Colors.red),
                  )
                : Text(
                    '(available now)',
                    style: TextStyle(
                        fontFamily: 'fonts1',
                        fontSize: 20,
                        color: Colors.green),
                  ),
            Spacer(),
            Get.arguments['coin'] == true
                ? IconButton(
                    onPressed: () {
                       Get.snackbar(
                      '',
                      'Coins can be used for washing',
                   
                      snackPosition: SnackPosition.TOP
                  );
                     
                     
                    },
                    icon: Image.asset('assets/images/dollar.png'))
                : Container(),
            Text('${Get.arguments['timeall']} hr.',
                style: TextStyle(fontFamily: 'fonts1', fontSize: 20)),
          ],
        ),
          Row(
                children: [
                  Spacer(),
                  Text(' ${Get.arguments['price']} .-', style: TextStyle(fontFamily: 'fonts1', fontSize: 20))
                ],
              ),
        ],
        ),
        content: Container(
          width: MediaQuery.of(context).size.width * 0.65,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              Row(
                children: [
                  Text('${Get.arguments['brand']} ',
                      style: TextStyle(fontFamily: 'fonts1', fontSize: 22)),
                  Text('(model :${Get.arguments['model']})',
                      style: TextStyle(fontFamily: 'fonts1', fontSize: 16)),
                ],
              ),
              Text('size ${Get.arguments['size']} kg.',
                  style: TextStyle(fontFamily: 'fonts1', fontSize: 22)),
              Get.arguments['condition'] == true
                  ? Text('start ${Get.arguments['timeS'].toString()} hr. ',
                      style: TextStyle(fontFamily: 'fonts1', fontSize: 22))
                  : Container(),
              Get.arguments['condition'] == true
                  ? Text('finish ${Get.arguments['finish'].toString()} hr. ',
                      style: TextStyle(fontFamily: 'fonts1', fontSize: 22))
                  : Container(),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      icon: Icon(
                        Icons.cancel,
                        size: 40,
                        color: Color.fromARGB(255, 43, 100, 110),
                      )),
                ],
              )
            ],
          ),
        ),
      );
}
