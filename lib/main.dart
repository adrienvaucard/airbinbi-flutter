import 'package:airbinbi_flutter/pages/citiesPage.dart';
import 'package:airbinbi_flutter/pages/datesPage.dart';
import 'package:airbinbi_flutter/pages/detailsPage.dart';
import 'package:airbinbi_flutter/pages/homePage.dart';
import 'package:airbinbi_flutter/pages/placesPage.dart';
import 'package:airbinbi_flutter/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: ROUTE_HOME_PAGE,
      routes: <String, WidgetBuilder> {
        ROUTE_HOME_PAGE: (BuildContext context) => HomePage(),
        ROUTE_LIST_CITIES_PAGE: (BuildContext context) => CitiesPage(),
        ROUTE_LIST_PLACES_PAGE: (BuildContext context) => PlacesPage(),
        ROUTE_PLACE_DETAILS_PAGE: (BuildContext context) => DetailsPage(),
        ROUTE_LIST_DATES_PAGE: (BuildContext context) => DatesPage(),
      },
    );
  }
}
