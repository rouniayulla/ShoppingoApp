import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingo/model/Map.dart';
import 'package:shoppingo/model/profile.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../model/profile.dart';
import '../model/profile.dart';

class UserDialog extends StatelessWidget {
  const UserDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return ChangeNotifierProvider(
        create: (context) => PurchasesModel(),
        child: Center(
            child: Container(
                // height: height * 0.8,
                margin: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: height * 0.05),
                child: SafeArea(
                    child: Scaffold(
                        body: CustomPopup(
                  name: 'Hello',
                  title: 'Hello',
                  city: 'Hello',
                  email: 'Hello',
                  phoneNumber: "heelo",
                ))))));
  }
}

class CustomPopup extends StatelessWidget {
  final String name;
  final String email;
  final String phoneNumber;
  final String city;
  final String title;

  const CustomPopup({
    Key? key,
    required this.title,
    required this.name,
    required this.email,
    required this.city,
    required this.phoneNumber,
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

    return Center(
      child: Container(
        // height: height * 0.87,
        margin: EdgeInsets.all(width * 0.05),
        child: SafeArea(
          child: Scaffold(
            //  resizeToAvoidBottomInset: false,
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                       SizedBox(height:height*0.03,),
                    Center(child: Text("معلومات المستخدم",style:TextStyle(fontSize:width*0.05,fontWeight:FontWeight.bold))),
                      SizedBox(height:height*0.01,),
                      Text(
                        "الاسم الثلاثي",
                        style: TextStyle(fontSize: width * 0.043),
                      ),
                      SizedBox(height: height * 0.015),
                      buildtextfield(
                          "رونيا رفيق عودة", model, false, 1, height, width),
                      SizedBox(height: height * 0.015),
                      Text(
                        "الايميل",
                        style: TextStyle(fontSize: width * 0.043),
                      ),
                      SizedBox(height: height * 0.015),
                      buildtextfield(
                          "rounia@gmail.com", model, false, 2, height, width),
                      SizedBox(height: height * 0.015),
                      Text(
                        "رقم الموبايل",
                        style: TextStyle(fontSize: width * 0.043),
                      ),
                      SizedBox(height: height * 0.015),
                      IntlPhoneField(
                        initialValue: "0981662881",
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        initialCountryCode: 'SY',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                        onCountryChanged: (country) {
                          print('Country changed to: ' + country.name);
                        },
                      ),
                      SizedBox(height: height * 0.015),
                      Text(
                        "المدينة",
                        style: TextStyle(fontSize: width * 0.043),
                      ),
                      SizedBox(height: height * 0.015),
                      buildtextfield(" حمص", model, false, 4, height, width),
                      SizedBox(height: height * 0.015),
                      Text(
                        "العنوان",
                        style: TextStyle(fontSize: width * 0.043),
                      ),
                      SizedBox(height: height * 0.015),
                      buildtextfield(
                          "حمص-شارع العشاق", model, false, 5, height, width),
                      SizedBox(height: height * 0.04),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('إلغاء'),
                            ),
                        
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildtextfield(
      String label, final model, bool isPass, int flag, var height, var width) {
    return Padding(
        padding: EdgeInsets.all(width * 0.002),
        child: TextFormField(
            keyboardType: TextInputType.text,
            enabled:false,
            initialValue: label,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: width * 0.003),
              ),
              prefixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit,
                      color: Color.fromARGB(250, 203, 59, 62))),
              contentPadding:
                  EdgeInsets.only(bottom: height * 0.02, right: width * 0.01),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
           
            ));
  }
}
