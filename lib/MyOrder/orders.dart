// ignore_for_file: prefer_const_constructors

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingo/MyOrder/productInfo.dart';
import 'package:shoppingo/model/Map.dart';
import 'package:shoppingo/model/profile.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../model/profile.dart';
import '../model/profile.dart';
import 'UserInfo.dart';


class orders extends StatelessWidget {
  const orders({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PurchasesModel(),
        child: Scaffold(body: Showorders()));
  }
}

class Showorders extends StatelessWidget {
  const Showorders({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PurchasesModel>(context);
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    final formKey = GlobalKey<FormState>();
    final controller = TextEditingController();
    String SelectedValue;
    bool check=model.getcheck();
    

    var purches = [
      [true],
      [false],
      [true],
      [false],
      [true],
      [false],
      [true],
      [false],
      [true],
      [false],
      [true],
      [false],
    ];
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: EdgeInsets.all(width * 0.014),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:height*0.03),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.021),
                      padding: EdgeInsets.symmetric(horizontal: width * 0.019),
                      child: Row(children: [
                        Flexible(
                          child: DropdownButtonFormField2(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromARGB(250, 203, 59, 62),
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.021),
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          250, 203, 59, 62))),
                            ),
                            isExpanded: true,
                            hint: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                children: [
                                  SizedBox(width: 0),
                                  Text(
                                    'حسب السعر',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: width * 0.034,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            items: model.PurchasesPrice.map((item) =>
                                DropdownMenuItem<String>(
                                  value: item,
                                  child: Center(
                                    child: Text(
                                      item,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(fontSize: width * 0.03),
                                    ),
                                  ),
                                )).toList(),
                            onChanged: (value) {},
                            onSaved: (value) {
                              SelectedValue = value.toString();
                            },
                            buttonStyleData: ButtonStyleData(
                              height: height * 0.05,
                              padding: EdgeInsets.only(
                                  left: width * 0.038, right: width * 0.038),
                            ),
                            iconStyleData: IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                              iconSize: width * 0.07,
                            ),
                          ),
                        ),
                        SizedBox(width: width * 0.05),
                        Flexible(
                          child: DropdownButtonFormField2(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromARGB(250, 203, 59, 62),
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.021),
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          250, 203, 59, 62))),
                            ),
                            isExpanded: true,
                            hint: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                children: [
                                  SizedBox(width: 0),
                                  Text(
                                    'حسب المعالجة',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: width * 0.034,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            items: model.PurchasesDone.map((item) =>
                                DropdownMenuItem<String>(
                                  value: item,
                                  child: Center(
                                    child: Text(
                                      item,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(fontSize: width * 0.03),
                                    ),
                                  ),
                                )).toList(),
                            onChanged: (value) {},
                            onSaved: (value) {
                              SelectedValue = value.toString();
                            },
                            buttonStyleData: ButtonStyleData(
                              height: height * 0.05,
                              padding: EdgeInsets.only(
                                  left: width * 0.038, right: width * 0.038),
                            ),
                            iconStyleData: IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                              iconSize: width * 0.06,
                            ),
                          ),
                        ),
                      ])),
                  SizedBox(height:height*0.03),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: purches.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(
                                top: height * 0.014,
                                left: width * 0.04,
                                bottom: height * 0.014,
                                right: width * 0.04),
                            width: width * 0.9,
                            margin: EdgeInsets.only(
                                left: width * 0.035,
                                top: height * 0.02,
                                right: width * 0.035,
                                bottom: height * 0.01),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color.fromARGB(255, 105, 101,
                                    101), // Set border color here
                                // Set border width here
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(width * 0.03)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(
                                    width * 0.0,
                                    height * 0.003,
                                  ),
                                  blurRadius: width * 0.02,
                                  spreadRadius: width * 0.003,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:MainAxisAlignment.center,
                                  children:[
                                  Checkbox(value: check, onChanged:(newValue){model.check(newValue);}),
                                  Text("تمت معالجته",style:TextStyle(fontSize:width*0.04))
                                   
                                 
                                  ]
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text("التاريخ والوقت"),
                                        Text("${model.formattedDate}",
                                            style: TextStyle(
                                                fontSize: width * 0.034)),
                                      ],
                                    ),
                                    SizedBox(width: width * 0.03),
                                    Column(
                                      children: [
                                        Text("طريقة الشراء"),
                                        Text("WEPAY"),
                                      ],
                                    ),
                                    SizedBox(width: width * 0.09),
                                    Column(
                                      children: [
                                         SizedBox(height: height * 0.007),
                                        Text("اسم الزبون",style:TextStyle(fontSize:width*0.037)),
                                        Text("غيث عثمان",style:TextStyle(fontSize:width*0.037)),
                                      ],
                                    ),
                                    
                                  ],
                                ),
                                SizedBox(height: height * 0.027),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return productInfo();
                                          },
                                        );
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                              horizontal: width * 0.055),
                                        child: Text("معلومات المنتج"),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.red),
                                        side: MaterialStateProperty.all<
                                            BorderSide>(
                                          BorderSide(
                                              color: Colors.red,
                                              width: width * 0.006),
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                         showDialog(
                                           context: context,
                                           builder: (BuildContext context) {
                                             return UserDialog();
                                           },
                                         );
                                      },
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width * 0.03),
                                          child: Text("معلومات المستخدم")),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.red),
                                        side: MaterialStateProperty.all<
                                            BorderSide>(
                                          BorderSide(
                                              color: Colors.red,
                                              width: width * 0.006),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height * 0.022),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: Text("إلغاء الطلبية")),
                              ],
                            ),
                          );
                        }),
                  )
                ])));
  }
}
