import 'package:flutter/material.dart';

// ignore: camel_case_types
class Sign_up_model extends ChangeNotifier {
  Icon eye = const Icon(
    Icons.visibility,
  );
  var press = true;
  Icon eye2 = const Icon(
    Icons.visibility,
  );
  var press2 = true;
  changeIcon() {
    if (press == true) {
      press = false;
      eye = const Icon(
        Icons.visibility_off,
      );
      notifyListeners();
    } else {
      press = true;
      eye = const Icon(
        Icons.visibility,
      );
      notifyListeners();
    }
  }

  changeIcon2() {
    if (press2 == true) {
      press2 = false;
      eye2 = const Icon(
        Icons.visibility_off,
      );
      notifyListeners();
    } else {
      press2 = true;
      eye2 = const Icon(
        Icons.visibility,
      );
      notifyListeners();
    }
  }
}

class Log_in_model extends ChangeNotifier {
  Icon eye = const Icon(
    Icons.visibility,
  );
  var press = true;
  changeIcon() {
    if (press == true) {
      press = false;
      eye = const Icon(
        Icons.visibility_off,
      );
      notifyListeners();
    } else {
      press = true;
      eye = const Icon(
        Icons.visibility,
      );
      notifyListeners();
    }
  }
}

class ForgetPass_model extends ChangeNotifier {
  var press = true;
  var press2 = true;
  var varify1, varify2, varify3, varify4;
  String varifyCode="";
  Icon eye = const Icon(
    Icons.visibility,
  );

  Icon eye2 = const Icon(
    Icons.visibility,
  );
  changeIcon() {
    if (press == true) {
      press = false;
      eye = const Icon(
        Icons.visibility_off,
      );
      notifyListeners();
    } else {
      press = true;
      eye = const Icon(
        Icons.visibility,
      );
      notifyListeners();
    }
  }

  changeIcon2() {
    if (press2 == true) {
      press2 = false;
      eye2 = const Icon(
        Icons.visibility_off,
      );
      notifyListeners();
    } else {
      press2 = true;
      eye2 = const Icon(
        Icons.visibility,
      );
      notifyListeners();
    }
  }

  verifyCode() {
    if (varify1 == null ||
        varify2 == null ||
        varify3 == null ||
        varify4 == null) {
      return false;
    }
    print(varify1);
    print(varify2);
    print(varify3);
    print(varify4);
    varifyCode = varify1 + varify2 + varify3 + varify4;
    print(varifyCode);
  
    if(varifyCode.length==4)
    return true;
    notifyListeners();
  
}

  bool vis=false;
  changeVis(){
    vis=!vis;
    notifyListeners();
  }
  notifyListeners();
 bool vis1=false;
  changeVis1(){
    vis1=!vis1;
    notifyListeners();
  }

}
