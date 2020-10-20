import 'dart:ui';
import 'package:cov_tracker/cubit/cubit.dart';
import 'package:cov_tracker/ui/app_styles/styles.dart';
import 'package:cov_tracker/ui/pages/detailCountry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  int pages = 10;
  bool isLoadMore = false;
  var f = NumberFormat('###,###');

  fetchData() async {
    await context.bloc<CaseCubit>().fetchCaseData();
    CaseState state = context.bloc<CaseCubit>().state;
    if (state is CaseLoaded) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

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
          if (!isLoading)
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Dashboard', style: titleStyle),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, bottom: 10),
                      height: 150,
                      width: double.infinity,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [boxShadow]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                Get.dialog(
                                  PhotoView(
                                    backgroundDecoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    imageProvider: NetworkImage(
                                      (context.bloc<CaseCubit>().state
                                              as CaseLoaded)
                                          .covidCase
                                          .image,
                                    ),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.info,
                                size: 18,
                                color: greyColor,
                              ),
                            ),
                          ),
                          Text(
                            'Globally',
                            style: subTitleStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Total Confirmed',
                                style: subTitleStyle.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey[600],
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                f
                                    .format((context.bloc<CaseCubit>().state
                                            as CaseLoaded)
                                        .covidCase
                                        .confirmed['value'])
                                    .toString(),
                                style: subTitleStyle.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Total Deaths',
                                style: subTitleStyle.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey[600],
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                f
                                    .format((context.bloc<CaseCubit>().state
                                            as CaseLoaded)
                                        .covidCase
                                        .deaths['value'])
                                    .toString(),
                                style: subTitleStyle.copyWith(
                                  color: Colors.red[300],
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Total Recovered',
                                style: subTitleStyle.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey[600],
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                f
                                    .format((context.bloc<CaseCubit>().state
                                            as CaseLoaded)
                                        .covidCase
                                        .recovered['value'])
                                    .toString(),
                                style: subTitleStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Confirmed Cases',
                                style: subTitleStyle.copyWith(
                                    fontWeight: FontWeight.w600),
                              ),
                              GestureDetector(
                                onTap: () => fetchData(),
                                child: Icon(
                                  Icons.refresh,
                                  size: 24,
                                  color: primaryColor,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Last Updated on ${DateFormat.yMEd().add_jms().format(DateTime.parse((context.bloc<CaseCubit>().state as CaseLoaded).covidCase.lastUpdate))}',
                            style: subTitleStyle.copyWith(
                              fontWeight: FontWeight.w200,
                              color: Colors.black38,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3 / 1.75,
                          ),
                          itemCount:
                              (context.bloc<CaseCubit>().state as CaseLoaded)
                                  .countries
                                  .length,
                          itemBuilder: (context, index) {
                            String country =
                                (context.bloc<CaseCubit>().state as CaseLoaded)
                                    .countries[index];
                            return FutureBuilder<Map>(
                              future: context
                                  .bloc<CaseCubit>()
                                  .fetchDetailCountry(country),
                              builder: (context, snap) {
                                if (snap.connectionState ==
                                    ConnectionState.done) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () => Get.to(DetailCountryCase(
                                        country: country,
                                        data: snap.data,
                                      )),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [boxShadow],
                                        ),
                                        padding: EdgeInsets.all(8),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 3,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  Text(
                                                    country,
                                                    style: subTitleStyle
                                                        .copyWith(fontSize: 14),
                                                  ),
                                                  Text(
                                                    snap.hasData
                                                        ? f.format(snap.data[
                                                                'confirmed']
                                                            ['value'])
                                                        : 'Not Found',
                                                    style:
                                                        subTitleStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: Icon(
                                                  Icons.info,
                                                  size: 18,
                                                  color: Colors.grey[400],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return loadingIndicator;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            loadingIndicator,
        ],
      ),
    );
  }
}
