import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shoppingo/model/product.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var sizes;
    var colors = [
      Colors.red,
      Colors.red,
      Colors.red,
      Colors.red,
      Colors.red,
      Colors.red,
      Colors.red,
      Colors.red,
      Colors.red,
      Colors.red,
      Colors.red,
      Colors.red,
      Colors.red,
      Colors.red,
      Colors.red,
      Colors.red
    ];
    var Images = [
      "assets/2.jpeg",
      "assets/1.jpg",
      "assets/11.jpeg",
      "assets/2.jpeg"
    ];
    var image = "assets/2.jpeg";
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => product_model(),
        )
      ],
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: height * 0.03),
            child: Column(
              children: [
                //Images
                SizedBox(
                    width: width * 0.9,
                    height: height * 0.3,
                    child: Consumer<product_model>(
                      builder: (context, model, child) {
                        return Stack(children: [
                          model.check
                              ? Image.asset(
                                  image,
                                  height: height * 0.3,
                                  width: width * 0.9,
                                )
                              : Image.asset(
                                  model.image,
                                  height: height * 0.3,
                                  width: width * 0.9,
                                ),
                          Positioned(
                            top: height * 0.135,
                            child: InkWell(
                              onTap: () {
                                model.preimg(Images);
                              },
                              child: Container(
                                  color: Color.fromARGB(250, 203, 59, 62),
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: height * 0.135,
                            child: InkWell(
                              onTap: () {
                                model.nextimg(Images);
                              },
                              child: Container(
                                  color: Color.fromARGB(250, 203, 59, 62),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ]);
                      },
                    )),
                //EndImages
                Divider(),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    ": الوصف",
                    style: TextStyle(
                        color: Color.fromARGB(255, 17, 29, 74),
                        fontSize: width * 0.07,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: height * 0.2,
                  width: width,
                  child: SingleChildScrollView(
                    child: Text(
                      "المنتج جميل المنتج جميل المنتج جميل المنتج جميل المنتج جميل المنتج جميل المنتج جميل المنتج جميل المنتج جميل المنتج جميل المنتج جميل المنتج جميل المنتج جميل المنتج جميل المنتج جميل المنتج جميل المنتج جميل المنتج جميل المنتج جميل المنتج جميل ",
                      style: TextStyle(fontSize: width * 0.04),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                Divider(),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    ": القياسات",
                    style: TextStyle(
                        color: Color.fromARGB(255, 17, 29, 74),
                        fontSize: width * 0.07,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                Consumer<product_model>(
                  builder: (context, model, child) {
                    return Row(
                      children: [
                        Container(
                          width: width * 0.4,
                          alignment: Alignment.centerRight,
                          child: RadioListTile(
                            selected: model.radioXS,
                            title: Padding(
                              padding: EdgeInsets.only(right: width * 0.05),
                              child: const Text(
                                "XS",
                                textAlign: TextAlign.end,
                              ),
                            ),
                            value: "XS",
                            groupValue: model.radioSelected,
                            onChanged: (value) {
                              model.selectedRadio(value);
                            },
                          ),
                        ),
                        SizedBox(
                          width: width * 0.1,
                        ),
                        Container(
                          width: width * 0.4,
                          alignment: Alignment.centerRight,
                          child: RadioListTile(
                            title: Padding(
                              padding: EdgeInsets.only(right: width * 0.05),
                              child: const Text(
                                "S",
                                textAlign: TextAlign.end,
                              ),
                            ),
                            value: "S",
                            groupValue: model.radioSelected,
                            onChanged: (value) {
                              model.selectedRadio(value);
                            },
                            selected: model.radioS,
                          ),
                        ),
                      ],
                    );
                  },
                ),

                Consumer<product_model>(
                  builder: (context, model, child) {
                    return Row(
                      children: [
                        Container(
                          width: width * 0.4,
                          alignment: Alignment.centerRight,
                          child: RadioListTile(
                            selected: model.radioM,
                            title: Padding(
                              padding: EdgeInsets.only(right: width * 0.05),
                              child: const Text(
                                "M",
                                textAlign: TextAlign.end,
                              ),
                            ),
                            value: "M",
                            groupValue: model.radioSelected,
                            onChanged: (value) {
                              model.selectedRadio(value);
                            },
                          ),
                        ),
                        SizedBox(
                          width: width * 0.1,
                        ),
                        Container(
                          width: width * 0.4,
                          alignment: Alignment.centerRight,
                          child: RadioListTile(
                            title: Padding(
                              padding: EdgeInsets.only(right: width * 0.05),
                              child: const Text(
                                "L",
                                textAlign: TextAlign.end,
                              ),
                            ),
                            value: "L",
                            groupValue: model.radioSelected,
                            onChanged: (value) {
                              model.selectedRadio(value);
                            },
                            selected: model.radioL,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Consumer<product_model>(
                  builder: (context, model, child) {
                    return Row(
                      children: [
                        Container(
                          width: width * 0.4,
                          alignment: Alignment.centerRight,
                          child: RadioListTile(
                            selected: model.radioXL,
                            title: Padding(
                              padding: EdgeInsets.only(right: width * 0.05),
                              child: const Text(
                                "XL",
                                textAlign: TextAlign.end,
                              ),
                            ),
                            value: "XL",
                            groupValue: model.radioSelected,
                            onChanged: (value) {
                              model.selectedRadio(value);
                            },
                          ),
                        ),
                        SizedBox(
                          width: width * 0.1,
                        ),
                        Container(
                          width: width * 0.4,
                          alignment: Alignment.centerRight,
                          child: RadioListTile(
                            title: Padding(
                              padding: EdgeInsets.only(right: width * 0.05),
                              child: const Text(
                                "2XL",
                                textAlign: TextAlign.end,
                              ),
                            ),
                            value: "2XL",
                            groupValue: model.radioSelected,
                            onChanged: (value) {
                              model.selectedRadio(value);
                            },
                            selected: model.radio2XL,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Consumer<product_model>(
                  builder: (context, model, child) {
                    return Row(
                      children: [
                        Container(
                          width: width * 0.4,
                          alignment: Alignment.centerRight,
                          child: RadioListTile(
                            selected: model.radio3XL,
                            title: Padding(
                              padding: EdgeInsets.only(right: width * 0.05),
                              child: const Text(
                                "3XL",
                                textAlign: TextAlign.end,
                              ),
                            ),
                            value: "3XL",
                            groupValue: model.radioSelected,
                            onChanged: (value) {
                              model.selectedRadio(value);
                            },
                          ),
                        ),
                        SizedBox(
                          width: width * 0.1,
                        ),
                        Container(
                          width: width * 0.4,
                          alignment: Alignment.centerRight,
                          child: RadioListTile(
                            title: Padding(
                              padding: EdgeInsets.only(right: width * 0.05),
                              child: const Text(
                                "4XL",
                                textAlign: TextAlign.end,
                              ),
                            ),
                            value: "4XL",
                            groupValue: model.radioSelected,
                            onChanged: (value) {
                              model.selectedRadio(value);
                            },
                            selected: model.radio4XL,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Consumer<product_model>(
                  builder: (context, model, child) {
                    return Row(
                      children: [
                        Container(
                          width: width * 0.4,
                          alignment: Alignment.centerRight,
                          child: RadioListTile(
                            selected: model.radio5XL,
                            title: Padding(
                              padding: EdgeInsets.only(right: width * 0.05),
                              child: const Text(
                                "5XL",
                                textAlign: TextAlign.end,
                              ),
                            ),
                            value: "5XL",
                            groupValue: model.radioSelected,
                            onChanged: (value) {
                              model.selectedRadio(value);
                            },
                          ),
                        ),
                        SizedBox(
                          width: width * 0.1,
                        ),
                        Container(
                          width: width * 0.4,
                          alignment: Alignment.centerRight,
                          child: RadioListTile(
                            title: Padding(
                              padding: EdgeInsets.only(right: width * 0.05),
                              child: const Text(
                                "6XL",
                                textAlign: TextAlign.end,
                              ),
                            ),
                            value: "6XL",
                            groupValue: model.radioSelected,
                            onChanged: (value) {
                              model.selectedRadio(value);
                            },
                            selected: model.radio6XL,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                //Collors
                Divider(),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    ": الكمية",
                    style: TextStyle(
                        color: Color.fromARGB(255, 17, 29, 74),
                        fontSize: width * 0.07,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: width * 0.02),
                    child: Text(
                      " 1000",
                      style: TextStyle(fontSize: width * 0.04),
                    ),
                  ),
                ),
                Divider(),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    ": الألوان",
                    style: TextStyle(
                        color: Color.fromARGB(255, 17, 29, 74),
                        fontSize: width * 0.07,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < colors.length; i++)
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: width * 0.01),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * 0.1),
                            color: Colors.red,
                          ),
                          width: width * 0.11,
                          height: height * 0.05,
                        ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    ": السعر والعنوان",
                    style: TextStyle(
                        color: Color.fromARGB(255, 17, 29, 74),
                        fontSize: width * 0.07,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "50000",
                    style: TextStyle(
                      color: Color.fromARGB(255, 17, 29, 74),
                      fontSize: width * 0.05,
                    ),
                  ),
                ),

                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "For_you",
                    style: TextStyle(
                      color: Color.fromARGB(255, 17, 29, 74),
                      fontSize: width * 0.04,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "حمص - شارع الحضارة - مقابل الإطفائية",
                    style: TextStyle(
                      color: Color.fromARGB(255, 17, 29, 74),
                      fontSize: width * 0.04,
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_cart),
                        label: Text("اضف الى"),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: Text("عرض المنتج على الخريطة"))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
