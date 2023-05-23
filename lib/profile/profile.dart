import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shoppingo/model/profile.dart';
import 'package:shoppingo/myPurchases/Purchases.dart';
import 'package:shoppingo/profile/statistics.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporrary = File(image.path);
      setState(() {
        this.image = imageTemporrary;
      });
    } on PlatformException catch (e) {
      print("Failed To Pick Image");
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => profile_model(),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("ملفي الشخصي"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: height * 0.03),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              //pic
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.02, bottom: height * 0.03),
                child: Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      image != null
                          ? ClipOval(
                              child: Image.file(
                                  width: width * 0.55,
                                  height: height * 0.25,
                                  fit: BoxFit.cover,
                                  File(image!.path)))
                          : CircleAvatar(
                              radius: width * 0.275, // Image radius
                              backgroundImage:
                                  ExactAssetImage('assets/profile.jpg'),
                            ),
                      Positioned(
                          top: height * 0.2,
                          left: width * 0.4,
                          child: InkWell(
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: width * 0.05,
                              child: Icon(
                                Icons.camera_alt_rounded,
                                size: width * 0.06,
                                color: Color.fromARGB(250, 203, 59, 62),
                              ),
                            ),
                            onTap: () => pickImage(),
                          )),
                    ],
                  ),
                ),
              )
              //tow buttons
              ,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 200),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return ScaleTransition(
                                  alignment: Alignment.center,
                                  scale: animation,
                                  child: child,
                                );
                              },
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return statistics();
                              },
                            ));
                      },
                      child: Text(
                        "إحصائياتي",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 200),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return ScaleTransition(
                                  alignment: Alignment.center,
                                  scale: animation,
                                  child: child,
                                );
                              },
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return Purchases();
                              },
                            ));
                      },
                      child: Text(
                        "مشترياتي",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Divider(),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                "معلوماتي الشخصية",
                style: TextStyle(
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 17, 29, 74)),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                "اسمي",
                style: TextStyle(fontSize: width * 0.055),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: height * 0.03),
                      child: Consumer<profile_model>(
                        builder: (context, model, child) {
                          return InkWell(
                            child: Text("تعديل"),
                            onTap: () {
                              model.changeName();
                            },
                          );
                        },
                      )),
                  Container(
                      width: width * 0.7,
                      child: Consumer<profile_model>(
                        builder: (context, model, child) {
                          return TextFormField(
                            textAlign: TextAlign.end,
                            initialValue: "غيث عثمان",
                            enabled: model.editName,
                          );
                        },
                      )),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                "إيميلي",
                style: TextStyle(fontSize: width * 0.055),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: height * 0.03),
                      child: Consumer<profile_model>(
                        builder: (context, model, child) {
                          return InkWell(
                            child: Text("تعديل"),
                            onTap: () {
                              model.changeEmail();
                            },
                          );
                        },
                      )),
                  Container(
                      width: width * 0.7,
                      child: Consumer<profile_model>(
                        builder: (context, model, child) {
                          return TextFormField(
                            textAlign: TextAlign.end,
                            initialValue: "ghaethoo2001.go@gmail.com",
                            enabled: model.editEmail,
                          );
                        },
                      )),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                "اسم متجري",
                style: TextStyle(fontSize: width * 0.055),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: height * 0.03),
                      child: Consumer<profile_model>(
                        builder: (context, model, child) {
                          return InkWell(
                            child: Text("تعديل"),
                            onTap: () {
                              model.changeStore();
                            },
                          );
                        },
                      )),
                  Container(
                      width: width * 0.7,
                      child: Consumer<profile_model>(
                        builder: (context, model, child) {
                          return TextFormField(
                            textAlign: TextAlign.end,
                            initialValue: "For_you",
                            enabled: model.editStore,
                          );
                        },
                      )),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                "عنوان متجري",
                style: TextStyle(fontSize: width * 0.055),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: height * 0.03),
                      child: Consumer<profile_model>(
                        builder: (context, model, child) {
                          return InkWell(
                            child: Text("تعديل"),
                            onTap: () {
                              model.changeAddress();
                            },
                          );
                        },
                      )),
                  Container(
                      width: width * 0.7,
                      child: Consumer<profile_model>(
                        builder: (context, model, child) {
                          return TextFormField(
                            textAlign: TextAlign.end,
                            initialValue: "حمص_شارع الحضارة",
                            enabled: model.editAddress,
                          );
                        },
                      )),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Text(
                "الدفع",
                style: TextStyle(fontSize: width * 0.055),
              ),
              Row(
                children: [
                  Container(
                      width: width * 0.45,
                      child: Consumer<profile_model>(
                        builder: (context, model, child) {
                          return RadioListTile(
                            title: Text(" عن طريق  \n  we pay "),
                            value: "WEpay",
                            selected: model.wePay,
                            groupValue: model.radioselected,
                            onChanged: (value) {
                              model.checkRadioButton(value);
                            },
                          );
                        },
                      )),
                  Container(
                    width: width * 0.45,
                    child: Consumer<profile_model>(
                      builder: (context, model, child) {
                        return RadioListTile(
                          selected: model.delevary,
                          title: Text("عند التسليم "),
                          value: "del",
                          groupValue: model.radioselected,
                          onChanged: (value) {
                            model.checkRadioButton(value);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Text(
                "wePay كود حسابي على ",
                style: TextStyle(fontSize: width * 0.055),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: height * 0.03),
                      child: Consumer<profile_model>(
                        builder: (context, model, child) {
                          return InkWell(
                            child: Text("تعديل"),
                            onTap: () {
                              model.changeCode();
                            },
                          );
                        },
                      )),
                  Container(
                      width: width * 0.7,
                      child: Consumer<profile_model>(
                        builder: (context, model, child) {
                          return TextFormField(
                            textAlign: TextAlign.end,
                            initialValue: "123456789 ",
                            enabled: model.editCode,
                          );
                        },
                      )),
                ],
              ),
              ElevatedButton(onPressed: () {}, child: Text("إرسال"))
            ]),
          ),
        ),
      ),
    );
  }
}
