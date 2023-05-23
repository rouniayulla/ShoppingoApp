import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:shoppingo/clothes/ProductDetails/Product.dart';

class product_model extends ChangeNotifier {
  var index = 0;
  var image;
  bool check = true;
  var radioSelected;
  bool radioXS = false;
  bool radioS = false;
  bool radioM = false;
  bool radioL = false;
  bool radioXL = false;
  bool radio2XL = false;
  bool radio3XL = false;
  bool radio4XL = false;
  bool radio5XL = false;
  bool radio6XL = false;

  selectedRadio(value) {
    radioSelected = value;
    if (radioSelected == "XS") {
      var radioXS = true;
      var radioS = false;
      var radioM = false;
      var radioL = false;
      var radioXL = false;
      var radio2XL = false;
      var radio3XL = false;
      var radio4XL = false;
      var radio5XL = false;
      var radio6XL = false;
      notifyListeners();
    } else if (radioSelected == "S") {
      var radioS = true;
      var radioXS = false;
      var radioM = false;
      var radioL = false;
      var radioXL = false;
      var radio2XL = false;
      var radio3XL = false;
      var radio4XL = false;
      var radio5XL = false;
      var radio6XL = false;
      notifyListeners();
    } else if (radioSelected == "M") {
      var radioM = true;
      var radioXS = false;
      var radioS = false;
      var radioL = false;
      var radioXL = false;
      var radio2XL = false;
      var radio3XL = false;
      var radio4XL = false;
      var radio5XL = false;
      var radio6XL = false;
      notifyListeners();
    } else if (radioSelected == "L") {
      var radioL = true;
      var radioXS = false;
      var radioS = false;
      var radioM = false;
      var radioXL = false;
      var radio2XL = false;
      var radio3XL = false;
      var radio4XL = false;
      var radio5XL = false;
      var radio6XL = false;
      notifyListeners();
    } else if (radioSelected == "XL") {
      var radioXL = true;
      var radioXS = false;
      var radioS = false;
      var radioL = false;
      var radioM = false;
      var radio2XL = false;
      var radio3XL = false;
      var radio4XL = false;
      var radio5XL = false;
      var radio6XL = false;
      notifyListeners();
    } else if (radioSelected == "2XL") {
      var radio2XL = true;
      var radioXS = false;
      var radioS = false;
      var radioL = false;
      var radioM = false;
      var radioXL = false;
      var radio3XL = false;
      var radio4XL = false;
      var radio5XL = false;
      var radio6XL = false;
      notifyListeners();
    } else if (radioSelected == "3XL") {
      var radio3XL = true;
      var radioXS = false;
      var radioS = false;
      var radioL = false;
      var radioM = false;
      var radio2XL = false;
      var radioXL = false;
      var radio4XL = false;
      var radio5XL = false;
      var radio6XL = false;
      notifyListeners();
    } else if (radioSelected == "4XL") {
      var radio4XL = true;
      var radioXS = false;
      var radioS = false;
      var radioL = false;
      var radioM = false;
      var radio2XL = false;
      var radio3XL = false;
      var radioXL = false;
      var radio5XL = false;
      var radio6XL = false;
      notifyListeners();
    } else if (radioSelected == "5XL") {
      var radio5XL = true;
      var radioXS = false;
      var radioS = false;
      var radioL = false;
      var radioM = false;
      var radio2XL = false;
      var radio3XL = false;
      var radio4XL = false;
      var radioXL = false;
      var radio6XL = false;
      notifyListeners();
    } else if (radioSelected == "6XL") {
      var radio6XL = true;
      var radioXS = false;
      var radioS = false;
      var radioL = false;
      var radioM = false;
      var radio2XL = false;
      var radio3XL = false;
      var radio4XL = false;
      var radio5XL = false;
      var radioXL = false;
      notifyListeners();
    }
    notifyListeners();
  }

  // product_model(List<String> images) {
  //   Images = images;
  //   image = Images[1];
  // }

  nextimg(Images) {
    if (Images.length != index + 1) {
      image = Images[index + 1];
      index = index + 1;
      check = false;
      notifyListeners();
    }
    notifyListeners();
  }

  preimg(Images) {
    if (index != 0) {
      image = Images[index - 1];
      index = index - 1;
      check = false;
      notifyListeners();
    }
    notifyListeners();
  }
}
