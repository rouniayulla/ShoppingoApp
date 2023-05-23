import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class profile_model extends ChangeNotifier {
  var editName = false;
  var editEmail = false;
  var editStore = false;
  var editAddress = false;
  var editCode = false;

  var radioselected;
  var wePay = false;
  var delevary = false;

  changeName() {
    if (editName)
      editName = false;
    else
      editName = true;
    notifyListeners();
  }

  changeEmail() {
    if (editEmail)
      editEmail = false;
    else
      editEmail = true;
    notifyListeners();
  }

  changeStore() {
    if (editStore)
      editStore = false;
    else
      editStore = true;
    notifyListeners();
  }

  changeAddress() {
    if (editAddress)
      editAddress = false;
    else
      editAddress = true;
    notifyListeners();
  }

  changeCode() {
    if (editCode)
      editCode = false;
    else
      editCode = true;
    notifyListeners();
  }

  checkRadioButton(value) {
    radioselected = value;
    if (radioselected == "del") {
      wePay = false;
      delevary = true;
      notifyListeners();
    } else {
      wePay = true;
      delevary = false;
      notifyListeners();
    }
    notifyListeners();
  }
}

class statistics_model extends ChangeNotifier {
  String dropdownvalue = 'السنة الحالية';
  var OptionSelected = 0;

  // List of items in our dropdown menu
  var items = [
    'السنة الحالية',
    'الشهر الحالي',
    'اليوم الحالي',
  ];
  changeSelcted(String? newValue) {
    dropdownvalue = newValue!;
    if (dropdownvalue == "السنة الحالية") {
      OptionSelected = 0;
      print("1");
      notifyListeners();
    } else if (dropdownvalue == 'الشهر الحالي') {
      OptionSelected = 1;
      notifyListeners();
    } else {
      OptionSelected = 2;
      notifyListeners();
    }
    notifyListeners();
  }
}

class PurchasesModel extends ChangeNotifier {
  bool update = false;
  bool updateandsave = false;
  bool _isChecked = false;
  check(param0){
    _isChecked=param0;
    notifyListeners();

  }
  getcheck(){
    return _isChecked;
  }
  changeUpdate() {
    update = true;
    notifyListeners();
  }

  changeUpdateAndASave() {
    updateandsave = !updateandsave;
    notifyListeners();
  }

  var PurchasesDone = [
    'حسب المعالجة',
    'تمت معالجته',
    'لم تتم معالجته',
  ];
  var PurchasesPrice = [
    'حسب السعر',
    'من الأرخص إلى الأغلى',
    'من الأغلى إلى الأرخص'
  ];

  String formattedDate =
      DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  notifyListeners();
}

class addProduct_model extends ChangeNotifier {
  String? gender;
  Color primarycolor = Color.fromRGBO(255, 255, 255, 1);
  bool male = true;
  bool female = false;
  var dropdownValueForMale = 'بنطال';
  var dropdownValueForFemale = 'تنورة';
  var dropdownValueForType = 'رياضي';
  late Color colorPicker;

  List<String> Sizes = [
    'XS',
    'S',
    'M',
    'L',
    'XL',
    'XXL',
    '3XL',
    '4XL',
    '5XL',
    '6XL'
  ];
  List<String> selectedSizes = [];
  var numberOfProduct = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0].cast<int>();
  var ColorSelected = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ].cast<int>();

  changeSelect(value) {
    gender = value.toString();
    if (gender == "male") {
      male = true;
      female = false;
    } else {
      male = false;
      female = true;
    }
    notifyListeners();
  }

  changeDropDown1(String? newValue) {
    dropdownValueForMale = newValue!;
    print(dropdownValueForMale);
    notifyListeners();
  }

  changeDropDown2(String? newValue) {
    dropdownValueForFemale = newValue!;
    print(dropdownValueForFemale);
    notifyListeners();
  }

  changeDropDownForType(String? newValue) {
    dropdownValueForType = newValue!;
    print(dropdownValueForType);
    notifyListeners();
  }

  bool sizesContainer = false;
  changeDropdownMultiSelected(value) {
    selectedSizes = value;
    if (selectedSizes.length != 0) {
      sizesContainer = true;
      notifyListeners();
    } else {
      sizesContainer = false;
      notifyListeners();
    }
    print(selectedSizes);
    notifyListeners();
  }

  increase(index) {
    numberOfProduct[index] = numberOfProduct[index] + 1;
    notifyListeners();
  }

  decrese(index) {
    if (numberOfProduct[index] != 0)
      numberOfProduct[index] = numberOfProduct[index] - 1;
    notifyListeners();
  }

  showColorPicker(index) {
    ColorSelected[index] = 1;
    print(ColorSelected[index]);
    notifyListeners();
  }

  hideColorPicker(index) {
    ColorSelected[index] = 0;
    notifyListeners();
  }

  changeColorPicker(color) {
    primarycolor = color;
    colorPicker = color;
    print(colorPicker);
    notifyListeners();
  }

  List<List<Color>> Colors = [
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
  ];
  addColorPicker(index) {
    ColorSelected[index] = 0;
    Colors[index].add(colorPicker);
    print(Colors);
    notifyListeners();
  }

  removeColor(index, color) {
    Colors[index].remove(color);
    notifyListeners();
  }

  File? image;
  pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporrary = File(image.path);
      this.image = imageTemporrary;
      notifyListeners();
    } on PlatformException catch (e) {
      print("Failed To Pick Image");
    }
  }

  File? image2;
  pickImage2() async {
    try {
      final image2 = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image2 == null) return;
      final imageTemporrary = File(image2.path);
      this.image2 = imageTemporrary;
      notifyListeners();
    } on PlatformException catch (e) {
      print("Failed To Pick Image");
    }
  }
}
