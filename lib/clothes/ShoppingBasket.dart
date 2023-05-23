import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShoppingBasket extends StatelessWidget {
  const ShoppingBasket({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var items = [
      1,
      2,
      3,
      4,
      4,
      4,
      4,
      4,
      4,
    ];
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.009),
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.02)),
              width: width,
              height: height * 0.65,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < items.length; i++)
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: width * 0.0002),
                              borderRadius:
                                  BorderRadius.circular(width * 0.02)),
                          margin:
                              EdgeInsets.symmetric(vertical: height * 0.0055),
                          width: width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.01),
                                width: width * 0.3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "القياس",
                                          style: TextStyle(
                                              fontSize: width * 0.035,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "ْXXL",
                                          style: TextStyle(
                                              fontSize: width * 0.035),
                                        ),
                                      ],
                                    ),
                                    Divider(height: height * 0.01),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.amber,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      width * 002)),
                                          height: height * 0.04,
                                          width: width * 0.09,
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Text(
                                          "اللون",
                                          style: TextStyle(
                                              fontSize: width * 0.035,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Divider(height: height * 0.01),
                                    ElevatedButton.icon(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.delete,
                                          size: width * 0.05,
                                        ),
                                        label: Text(
                                          "حذف الطلبية",
                                          style:
                                              TextStyle(fontSize: width * 0.03),
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                width: width * 0.3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "اسم المتجر",
                                      style: TextStyle(
                                          fontSize: width * 0.035,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "For_You",
                                      style: TextStyle(fontSize: width * 0.035),
                                    ),
                                    Divider(height: height * 0.01),
                                    Text(
                                      "السعر",
                                      style: TextStyle(
                                          fontSize: width * 0.035,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "70000",
                                      style: TextStyle(fontSize: width * 0.035),
                                    ),
                                    Divider(height: height * 0.01),
                                    Text(
                                      "الكمية",
                                      style: TextStyle(
                                          fontSize: width * 0.035,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.remove_circle,
                                          color:
                                              Color.fromARGB(250, 203, 59, 62),
                                        ),
                                        SizedBox(
                                          width: width * 0.03,
                                        ),
                                        Text("1"),
                                        SizedBox(
                                          width: width * 0.03,
                                        ),
                                        Icon(
                                          Icons.add_circle,
                                          color:
                                              Color.fromARGB(250, 203, 59, 62),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Image.asset(
                                "assets/2.jpeg",
                                width: width * 0.3,
                              ),
                            ],
                          )),
                    SizedBox()
                  ],
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "700000",
                style: TextStyle(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ": المجموع الكلي ",
                style: TextStyle(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.delete),
                label: Text("حذف الكل"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("شراء"),
              )
            ],
          )
        ],
      ),
    );
  }
}
