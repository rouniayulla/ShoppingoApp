

// import 'dart:convert';

// import 'package:flutter/material.dart';
// // import 'dart:async';
// // import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:provider/provider.dart

// import '../Sellers/ApIforMap.dart';
// import '../model/Map.dart';

// ignore_for_file: non_constant_identifier_names

// ignore: camel_case_types
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:shoppingo/Sellers/ApIforMap.dart';
import "package:http/http.dart" as http;

import 'Seller.dart';


class MapShow extends ChangeNotifier {
  double CurrentLat = 760.0;
  double CurrentLog = 0.0;
  bool flag = false;
  ChangeCurrentLocation() {}
  notifyListeners();
}

class LocationMap extends ChangeNotifier {
  double lati = 0.0;
  double logn = 0.0;
  double get positionlat => lati;
  double get positionlog => logn;
  late double total_distance = 1.0;
  late double total_duration = 1.0;
  late double total_distance1 = 1.0;
  late double total_duration1 = 1.0;
  late double EndLat = 1.0;
  late double EndLog = 1.0;
  List listOfPoints = [];
  List listOfPoints1 = [];
  List<LatLng> points = [];
  List listOfPoints2 = [];
  List listOfPoints22 = [];
  List<LatLng> points2 = [];
  var r = [];

  var r1 = [];
  bool off = false;
  bool off1=false;
 static   List<Contacts> main_List = [
    Contacts("Rounia1\n", "./assets/13.jpg", "حمص", "0937082264","صاغة"),
    Contacts("Rounia2\n", "./assets/13.jpg", "حمص", "0937082264","صاغة"),
    Contacts("Rounia3\n", "./assets/13.jpg", "حمص", "0937082264","صاغة"),
    Contacts("Rounia4\n", "./assets/13.jpg", "حلب", "0937082264","بقالية"),
    Contacts("Rounia5\n", "./assets/13.jpg", "حلب", "0937082264","بقالية"),
    Contacts("Rounia6\n", "./assets/13.jpg", "حلب", "0937082264","بقالية"),

  ];
  List<Contacts> display_List = main_List;
  String countreyValue='حسب المحافظة';
    String categoryValue= 'حسب نوع المتجر';
 
  var countries=[
    'حسب المحافظة',
    'حمص',
    'حلب',
    'دمشق',
    'طرطوس',
    'اللاذقية',
    'حماة',
    'إدلب',
    'الرقة',
    'دير الزور',
  ];
   var categories=[
    'حسب نوع المتجر',
    'ألبسة',
    'أحذية',
    'مواد غذائية',
    'صاغة',
    'مواد تنظيف',
    'بقالية',
    'محمصة',
    'بالة',
    
  ];
  
  void getCurrent() async {
    await Geolocator.requestPermission();
    Position _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lati = _position.latitude;
    logn = _position.longitude;
    off = true;
    notifyListeners();
  }

  getCoordinates(double x, double y) async {
    EndLat = x;
    EndLog = y;
   
 print(getRouteUrl("36.503970,34.810179", "${EndLat},${EndLog}"));
   
    var response = await http
        .get(getRouteUrl("36.503970,34.810179", "${36.504070},${34.810180}"));
    var response1 = await http
        .get(getRouteUrl1("36.503970,34.810179", "${36.504070},${34.810180}"));
    if (response.statusCode == 200) {
      
       off1=true;
      var data = jsonDecode(response.body);
      var data1 = jsonDecode(response1.body);
      r = data['features'][0]['properties']['segments'][0]['steps'];
      //  print(r);
      listOfPoints = data['features'][0]['geometry']['coordinates'];
      listOfPoints1 = data['features'][0]['properties']['segments'][0]['steps'];
      points = listOfPoints
          .map((p) => LatLng(p[1].toDouble(), p[0].toDouble()))
          .toList();
      r.forEach((element) {
        print(element['name']);

        total_distance += element['distance'];
      });
      r.forEach((ele) {
        total_duration += ele['duration'];
      });

      r1 = data1['features'][0]['properties']['segments'][0]['steps'];
    
      listOfPoints2 = data['features'][0]['geometry']['coordinates'];
      listOfPoints22 =
          data['features'][0]['properties']['segments'][0]['steps'];
      points2 = listOfPoints2
          .map((p) => LatLng(p[1].toDouble(), p[0].toDouble()))
          .toList();
      r1.forEach((element) {
        total_distance1 += element['distance'];
      });
      r1.forEach((ele) {
        total_duration1 += ele['duration'];
      });
   
    }

    print(total_duration);
    notifyListeners();
  }
}
