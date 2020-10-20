import 'package:cov_tracker/ui/app_styles/styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailCountryCase extends StatefulWidget {
  final String country;
  final Map data;
  DetailCountryCase({this.country, this.data});

  @override
  _DetailCountryCaseState createState() => _DetailCountryCaseState();
}

class _DetailCountryCaseState extends State<DetailCountryCase> {
  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor = const Color(0xffff5182);
  final double width = 7;

  List<BarChartGroupData> rawBarGroups;
  List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  primaryColor,
                  primaryColor.withOpacity(.5),
                ],
                stops: [0, 4],
                tileMode: TileMode.clamp,
              ),
            ),
            height: kToolbarHeight * 2,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(Icons.arrow_back_ios, color: whiteColor),
                        ),
                        SizedBox(width: 10),
                        Text(widget.country, style: titleStyle),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [boxShadow]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            'Overview',
                            style: subTitleStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  maxRadius: 10,
                                  backgroundColor: primaryColor,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      widget.data['confirmed']['value']
                                          .toString(),
                                      style: subTitleStyle.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('Total Confirmed'),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  maxRadius: 10,
                                  backgroundColor: Colors.black45,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      widget.data['recovered']['value']
                                          .toString(),
                                      style: subTitleStyle.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('Total Recovered'),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          color: Colors.transparent,
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                maxRadius: 10,
                                backgroundColor: redColor,
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    widget.data['deaths']['value'].toString(),
                                    style: subTitleStyle.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Total Death'),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Last Update :\n${DateFormat.yMEd().add_jms().format(DateTime.parse(widget.data['lastUpdate']))}',
                    style: subTitleStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
