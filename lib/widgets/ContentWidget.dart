import 'package:flutter/material.dart';
import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';
import '../constants.dart';
import '../screens/ReservationsScreen.dart';

class ContentWidget extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double price;
  final double rate;

  ContentWidget(
      {this.imageUrl, this.title, this.subtitle, this.price, this.rate});
  @override
  _ContentWidgetState createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10.0,
              spreadRadius: 0.0,
              offset: Offset(2, 2), // shadow direction: bottom right
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RatingBar(
                            icon: Icon(
                              Icons.star,
                              color: Colors.grey,
                              size: 15,
                            ),
                            allowHalfRating: true,
                            color: Colors.deepOrangeAccent,
                            rating: widget.rate,
                            starCount: 5,
                            size: 15),
                        Text('  (571)')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'Segoue',
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              widget.subtitle,
                              style: TextStyle(
                                fontFamily: 'Segoue',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            icon,
                            size: 30,
                            color: iconColor,
                          ),
                          onPressed: () {
                            setState(() {
                              if (icon == Icons.favorite_border_outlined) {
                                icon = Icons.favorite;
                                iconColor = Colors.red;
                              } else {
                                icon = Icons.favorite_border_outlined;
                                iconColor = Colors.grey;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'From ${widget.price}\$',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 15,
                            color: kActiveBackgroundColor,
                            fontFamily: 'Segoue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
