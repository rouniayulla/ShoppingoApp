import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'Categories.dart';
import 'Items.dart';

class SHOWCLOTHES extends StatefulWidget {
  const SHOWCLOTHES({super.key});

  @override
  State<SHOWCLOTHES> createState() => _SHOWCLOTHESState();
}

class _SHOWCLOTHESState extends State<SHOWCLOTHES> {
  var categories = ["رجالي", "نسائي"];
  late String selectedValue;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            //temporary
            // height: 500,
            margin:EdgeInsets.symmetric(horizontal:width*0.021),
            padding: EdgeInsets.only(top: height*0.015),
            decoration: BoxDecoration(
                color:Colors.white ,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(width*0.05),
                  topRight: Radius.circular(width*0.05),
                )),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal:width*0.025),
                  padding: EdgeInsets.symmetric(horizontal:width*0.03),
                  height: height*0.06,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 246, 217, 217),
                      borderRadius: BorderRadius.circular(width*0.05)),
                  child: Row(children: [
                    Icon(Icons.search, color: Colors.red, size: width*0.06),
                    Spacer(),
                    Container(
                        margin: EdgeInsets.only(left: width*0.03),
                        height: height*0.06,
                        width: width*0.4,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: ""),
                        ))
                  ]),
                ),
                SizedBox(height:height*0.02),
                Container(
                   margin: EdgeInsets.symmetric(horizontal: width*0.021),
                  padding: EdgeInsets.symmetric(horizontal: width*0.019),
                  
                    child: Row(children: [
                 
                  Flexible(
                    child: DropdownButtonFormField2(
                      
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:const Color.fromARGB(250, 203, 59, 62),
                        
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width*0.021),
                          borderSide: BorderSide(color:const Color.fromARGB(250, 203, 59, 62) )
                        ),
                      ),
                    
                      isExpanded: true,
                      hint: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            SizedBox(width: 0),
                            Text(
                              'نوع الملابس',
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: width*0.038,color:Colors.white),
                            ),
                          ],
                        ),
                      ),
                      items: categories
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Center(
                                  child: Text(
                                    item,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(fontSize: width*0.03),
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {},
                      onSaved: (value) {
                        selectedValue = value.toString();
                      },
                      buttonStyleData:  ButtonStyleData(
                        height: height*0.05,
                        padding: EdgeInsets.only(left: width*0.038, right: width*0.038),
                      ),
                      iconStyleData:  IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        iconSize: width*0.07,
                      ),
                    ),
                  ),
                  SizedBox(width:width*0.05),
                  Flexible(
                      child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:const Color.fromARGB(250, 203, 59, 62),
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width*0.021),
                          borderSide: BorderSide(color:const Color.fromARGB(250, 203, 59, 62) )
                        ),
                        
                      ),
                    
                      isExpanded: true,
                      hint: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            SizedBox(width: 0),
                             Text(
                              'نوع الملابس',
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: width*0.038,color:Colors.white),
                            ),
                          ],
                        ),
                      ),
                      items: categories
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Center(
                                  child: Text(
                                    item,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(fontSize: width*0.03),
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {},
                      onSaved: (value) {
                        selectedValue = value.toString();
                      },
                      buttonStyleData:  ButtonStyleData(
                        height: height*0.05,
                        padding: EdgeInsets.only(left: width*0.038, right: width*0.038),
                      ),
                      iconStyleData:  IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        iconSize: width*0.06,
                      ),
                    ),
                    ),
                ])),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(
                    vertical: height*0.02,
                    horizontal: width*0.03
                  ),
                  child:Text("التصنيفات",style:TextStyle(
                    fontSize:width*0.05,
                    fontWeight:FontWeight.bold,
                    color: Color.fromARGB(250, 203, 59, 62)
                  ))
                ),
                CategoriesWidget(),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(
                       vertical: height*0.02,
                    horizontal: width*0.03
                  ),
                  child:Text("الألبسة",style:TextStyle(
                    fontSize:width*0.05,
                    fontWeight:FontWeight.bold,
                    color: Color.fromARGB(250, 203, 59, 62)
                  ))
                ),
                ItemsWidget()
              ],
            ),
          )
        ],
      ),
    );
  }
}
