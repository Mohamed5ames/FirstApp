import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/ReservationsScreen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DevicePreview(
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    double screenWidth = (MediaQuery.of(context).size.width);
    double screenHeight = (MediaQuery.of(context).size.height);
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      home: Scaffold(
        body: Container(
          width: screenWidth,
          height: screenHeight,
          color: Colors.red,
          child: Center(
            child: LayoutBuilder(builder: (context, constrains) {
              double localHeight = constrains.maxHeight;
              double localWidth = constrains.maxWidth;
              return Container(
                width: localWidth / 2,
                height: localHeight * 0.5,
                color: Colors.white,
                child: RaisedButton(
                  child: Text("Go To My Reservations"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReservationsScreen()),
                    );
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
