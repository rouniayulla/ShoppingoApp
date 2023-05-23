import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../model/Map.dart';

class testMap extends StatelessWidget {
  const testMap({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LocationMap(), child: Scaffold(body: Sellers()));
  }
}

class Sellers extends StatelessWidget {
  const Sellers({super.key});

  @override
  Widget build(BuildContext context) {
    final location = Provider.of<LocationMap>(context);
    String def = "....";
    if (location.off == false && location.off1 == false) {
      location.getCurrent();

      doing() async {
        await location.getCoordinates(38.504070, 34.810180);
        print(location.total_distance);
      }

      doing();
    }
    var _controller = TextEditingController();

    void clear() {
      location.display_List = LocationMap.main_List;
    }

    void UpdateList(String name) {
      location.display_List = LocationMap.main_List
          .where((ele) => ele.name!.toLowerCase().contains(name.toLowerCase()))
          .toList();
    }

    void Updatebycountrey(String site) {
      // print(categoryValue);
      location.countreyValue = site;
      if (location.categoryValue != "حسب نوع المتجر") {
        location.display_List = LocationMap.main_List
            .where((ele) =>
                ele.site!.toLowerCase().contains(site.toLowerCase()) &
                ele.type!
                    .toLowerCase()
                    .contains(location.categoryValue.toLowerCase()))
            .toList();
      } else {
        location.display_List = LocationMap.main_List
            .where(
                (ele) => ele.site!.toLowerCase().contains(site.toLowerCase()))
            .toList();
      }
    }

    void Updatebycategory(String type) {
      location.categoryValue = type;

      if (location.countreyValue != "حسب المحافظة") {
        location.display_List = LocationMap.main_List
            .where((ele) =>
                ele.type!.toLowerCase().contains(type.toLowerCase()) &
                ele.site!
                    .toLowerCase()
                    .contains(location.countreyValue.toLowerCase()))
            .toList();
      } else {
        location.display_List = LocationMap.main_List
            .where(
                (ele) => ele.type!.toLowerCase().contains(type.toLowerCase()))
            .toList();
      }
    }

    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return true
        ? Scaffold(
            body: Padding(
            padding: EdgeInsets.all(width * 0.02),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(width * 0.036),
                    child: SizedBox(
                      width: width * 1.1,
                      child: TextField(
                        controller: _controller,
                        onChanged: (value) => {},
                        maxLines: 1,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.02),
                              borderSide: BorderSide(
                                  width: width * 0.008,
                                  color: Color.fromARGB(250, 203, 59, 62))),
                          hintText: "",
                          alignLabelWithHint: false,
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          prefixIcon: IconButton(
                              onPressed: () {
                                _controller.clear();
                                location.display_List = LocationMap.main_List;
                              },
                              icon: Icon(Icons.close)),
                          prefixIconColor: Color.fromARGB(250, 203, 59, 62),
                          suffixIcon: Icon(Icons.search),
                          suffixIconColor: Color.fromARGB(250, 203, 59, 62),
                        ),
                      ),
                    ),
                  ),
                  // Text("sdjdh"),
                  Row(
                    children: [
                      SizedBox(width: width * 0.03),
                      Expanded(
                          child: DropdownButtonFormField(
                        // colo
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              //<-- SEE HERE
                              borderSide: BorderSide(
                                  color: Color.fromARGB(250, 203, 59, 62),
                                  width: width * 0.001),
                              borderRadius:
                                  BorderRadius.circular(width * 0.06)),
                          focusedBorder: OutlineInputBorder(
                              //<-- SEE HERE
                              borderSide: BorderSide(
                                  color: Color.fromARGB(250, 203, 59, 62),
                                  width: width * 0.001),
                              borderRadius:
                                  BorderRadius.circular(width * 0.06)),
                          filled: true,
                          fillColor: Color.fromARGB(250, 203, 59, 62),
                        ),
                        dropdownColor: Color.fromARGB(250, 203, 59, 62),
                        value: location.categoryValue,
                        onChanged: (value) => {Updatebycategory(value!)},
                        iconDisabledColor: Colors.white,
                        iconEnabledColor: Colors.white,
                        items: location.categories
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                  fontSize: width * 0.037,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Cairo",
                                  color: Colors.white),
                            ),
                          );
                        }).toList(),
                      )),
                      SizedBox(width: width * 0.02),
                      Expanded(
                          child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              //<-- SEE HERE
                              borderSide: BorderSide(
                                  color: Colors.white, width: width * 0.001),
                              borderRadius:
                                  BorderRadius.circular(width * 0.06)),
                          focusedBorder: OutlineInputBorder(
                              //<-- SEE HERE
                              borderSide: BorderSide(
                                  color: Colors.white, width: width * 0.001),
                              borderRadius:
                                  BorderRadius.circular(width * 0.06)),
                          filled: true,
                          fillColor: Color.fromARGB(250, 203, 59, 62),
                        ),
                        dropdownColor: Color.fromARGB(250, 203, 59, 62),
                        value: location.countreyValue,
                        onChanged: (value) => {Updatebycountrey(value!)},
                        iconDisabledColor: Colors.white,
                        iconEnabledColor: Colors.white,
                        items: location.countries
                            .map<DropdownMenuItem<String>>((String value) {
                          print(value);
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Center(
                              child: Text(
                                value,
                                style: TextStyle(
                                    fontSize: width * 0.037,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          );
                        }).toList(),
                      )),
                      SizedBox(width: width * 0.025),
                    ],
                  ),
                  SizedBox(height: height * 0.04),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    InkWell(
                        onTap: () {},
                        child: Text("اضغط هنا",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.035,
                            ))),
                    SizedBox(width: width * 0.018),
                    Text("لرؤية المتاجر على الخريطة",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.035,
                        )),
                  ]),
                  // SizedBox(height:height*0.02),
                  Expanded(
                      child: location.display_List.length == 0
                          ? Center(
                              child: Text("لا نتائج للبحث",
                                  style: TextStyle(
                                      fontSize: width * 0.034,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold)))
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: location.display_List.length,
                              // physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                // doing async()
                                // location.getCoordinates(34.9898,32.93892);

                                return Container(
                                  padding: EdgeInsets.only(
                                      top: height * 0.007,
                                      left: width * 0.01,
                                      bottom: height * 0.007,
                                      right: width * 0.01),
                                  //Cart for User(Send & request)

                                  width: width * 0.9,
                                  margin: EdgeInsets.only(
                                      left: width * 0.024,
                                      top: height * 0.02,
                                      right: width * 0.024,
                                      bottom: height * 0.01),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(
                                          width * 0.0,
                                          height * 0.003,
                                        ),
                                        blurRadius: width * 0.02,
                                        spreadRadius: width * 0.003,
                                      ), //BoxShadow
                                      //BoxShadow
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      // SizedBox(width: 5.w),

                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(height: height * 0.02),
                                          RichText(
                                            textAlign: TextAlign.end,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text: location
                                                      .display_List[index].name,
                                                  style: TextStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                              221, 12, 12, 12),
                                                      fontSize: width * 0.043,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              TextSpan(
                                                  text:
                                                      "محل ألبسة_الحضارة_شارع العشاق\n",
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: width * 0.04,
                                                  )),
                                              TextSpan(
                                                  text:
                                                      " يبعد مشيا عبر الأقدام",
                                                  style: TextStyle(
                                                    color: const Color.fromARGB(
                                                        255, 12, 9, 0),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: width * 0.03,
                                                  )),
                                              TextSpan(
                                                  text: location.off1
                                                      ? " ${location.total_distance} كم"
                                                      : "${def} كم",
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: width * 0.03,
                                                  )),
                                              TextSpan(
                                                  text: " وعبر السيارة",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: width * 0.03,
                                                  )),
                                              TextSpan(
                                                  text: location.off1
                                                      ? "${location.total_distance1} كم\n"
                                                      : "${def} كم\n",
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: width * 0.03,
                                                  )),
                                              TextSpan(
                                                  text: " يستغرق زمنا مشيا",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: width * 0.03,
                                                  )),
                                              TextSpan(
                                                  text: location.off1
                                                      ? " ${location.total_duration}  ساعة"
                                                      : "${def}  ساعة",
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: width * 0.03,
                                                  )),
                                              TextSpan(
                                                  text: " وعبر السيارة",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: width * 0.03,
                                                  )),
                                              TextSpan(
                                                  text: location.off1
                                                      ? "  ${location.total_duration1} دقيقة"
                                                      : "${def}  ساعة",
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: width * 0.03,
                                                  )),
                                            ]),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.45,
                                                  top: height * 0.008),
                                              child: Row(
                                                // mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Icon(Icons.location_pin,
                                                      size: width * 0.05,
                                                      color: Colors.red),
                                                  InkWell(
                                                      onTap: () async {},
                                                      child: Text("الموقع",
                                                          style: TextStyle(
                                                              color: Colors.red,
                                                              fontSize:
                                                                  width * 0.04,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)))
                                                ],
                                              ))
                                        ],
                                      ),

                                      // SizedBox(width: 5.w),

                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                            '${location.display_List[index].image}'),
                                        radius: width * 0.1,
                                      ),
                                      //  SizedBox(width: 5.w),
                                    ],
                                  ),
                                );
                              }))
                ]),
          ))
        : Center(child: CircularProgressIndicator());
  }
}
