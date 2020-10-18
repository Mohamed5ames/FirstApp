import 'package:first_screen/models/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/HeaderButton.dart';
import '../constants.dart';
import '../widgets/ContentWidget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum choose {
  reservations,
  completed,
}

class ReservationsScreen extends StatefulWidget {
  static const String id = 'Reservation_Screen';
  @override
  _ReservationsScreenState createState() => _ReservationsScreenState();
}

choose theChoice;
var icon = Icons.favorite_border_outlined;
Color iconColor = Colors.grey;

class _ReservationsScreenState extends State<ReservationsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: kActiveBackgroundColor,
          ),
          title: Text(
            ' My reservation',
            style: TextStyle(
                fontFamily: 'Segoue',
                fontSize: 25.0,
                color: kActiveBackgroundColor,
                fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.white,
          elevation: 6,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    HeaderButton(
                      onPress: () {
                        setState(() {
                          theChoice = choose.reservations;
                        });
                      },
                      buttonText: 'Reservations',
                      labelColor: theChoice == choose.reservations
                          ? kActiveTextColor
                          : kInactiveTextColor,
                      buttonColor: theChoice == choose.reservations
                          ? kActiveBackgroundColor
                          : kInactiveBackgroundColor,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    HeaderButton(
                      onPress: () {
                        setState(() {
                          theChoice = choose.completed;
                        });
                      },
                      buttonText: 'Completed',
                      labelColor: theChoice == choose.completed
                          ? kActiveTextColor
                          : kInactiveTextColor,
                      buttonColor: theChoice == choose.completed
                          ? kActiveBackgroundColor
                          : kInactiveBackgroundColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    itemBuilder: (_, index) => ContentWidget(
                          imageUrl: imagesURLs[index],
                        ),
                    separatorBuilder: (_, index) => SizedBox(
                          height: 20,
                        ),
                    itemCount: imagesURLs.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
