import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingo/model/Map.dart';
import 'package:shoppingo/model/profile.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../model/profile.dart';
import '../model/profile.dart';

class productInfo extends StatelessWidget {
  const productInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return ChangeNotifierProvider(
        create: (context) => PurchasesModel(),
        child: Center(
            child: Container(
                height: height * 0.8,
                margin: EdgeInsets.all(width * 0.06),
                
                child: SafeArea(
                    child: Scaffold(
                        body: CustomPopup(image: "", price: "", info: []))))));
  }
}

class CustomPopup extends StatelessWidget {
  final String image;
  final String price;
  final List info;

  const CustomPopup({
    Key? key,
    required this.image,
    required this.price,
    required this.info,
  }) : super(key: key);
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PurchasesModel>(context);
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    final controller = TextEditingController();
    TextEditingController myController = TextEditingController();

    return Container(
       
      child: Center(
        child: SafeArea(
          child: Scaffold(
            //  resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
                reverse: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height:height*0.03,),
                    Center(child: Text("تفاصيل المنتج",style:TextStyle(fontSize:width*0.055,fontWeight:FontWeight.bold))),
                    Container(
                        margin: EdgeInsets.all(width * 0.016),
                        child: Center(
                          child: Image.asset("assets/1.jpg",
                              width: width * 0.7, height: height * 0.30),
                        )),
                    SizedBox(height: height * 0.001),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("70000 p.s",
                            style: TextStyle(
                                fontSize: width * 0.055,
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                        Text(":السعر",
                            style: TextStyle(
                                fontSize: width * 0.055,
                                color: Color.fromARGB(255, 10, 10, 10),
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: height * 0.025),
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.03),
                      child: Text("القياسات والألوان والكمية",
                          style: TextStyle(
                              fontSize: width * 0.045,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: height * 0.03),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                            Container(
                              margin:
                                  EdgeInsets.symmetric(horizontal: width * 0.015),
                              padding: EdgeInsets.symmetric(
                                  vertical: height * 0.003,
                                  horizontal: width * 0.05),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(width * 0.04),
                                  border: Border.all(
                                      color: Color.fromARGB(255, 47, 27, 139),
                                      width: width * 0.005)),
                              child: Container(
                                height: height * 0.12,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("XL-50",
                                          style:
                                              TextStyle(fontSize: width * 0.034)),
                                      SizedBox(height: height * 0.005),
                                      for (int i = 1; i < 8; i++)
                                        Container(
                                          height: height * 0.05,
                                          width: width * 0.05,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.pink),
                                        ),
                                      // SizedBox(height: height * 0.0001),
                                    ],
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.05),
                    Center(
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Padding(
                          padding:  EdgeInsets.all(width*0.02),
                          child: Text('   إلغاء  '),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
