import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingo/auth/ForgetPass.dart';
import 'package:shoppingo/auth/Sign_up.dart';
import 'package:shoppingo/model/auth.dart';

class Log_in extends StatelessWidget {
   Log_in({super.key});
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Log_in_model())],
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/Sign_up.png",
                    height: height * 0.7,
                  ),
                ),
                Positioned(
                  top: height * 0.55,
                  child: Container(
                    height: height / 2.4,
                    width: width,
                    decoration: BoxDecoration(
                      border: Border.all(
                          style: BorderStyle.solid,
                          width: 2,
                          color: const Color.fromARGB(255, 203, 59, 62)),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.035, horizontal: width * 0.02),
                      child: Form(
                        key:formKey,
                        child: SingleChildScrollView(
                             reverse:true,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "تسجيل دخول",
                                style: TextStyle(
                                    fontSize: width * 0.056,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(255, 17, 29, 74)),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  hintText: "ادخل الإيميل",
                                  suffixIcon: const Icon(Icons.email),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(width: width * 0.01),
                                  ),
                                ),
                                validator: (value) {
                                      if (value!.isEmpty || value == null) {
                                        return 'البريد الالكتروني فارغ';
                                      } else if (!RegExp(
                                              r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                          .hasMatch(value)) {
                                        return 'البريد الالكتروني غير صحيح';
                                      }
                                      {
                                        return null;
                                      }
                                    },
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Consumer<Log_in_model>(
                                builder: (context, model, child) {
                                  return TextFormField(
                                    obscureText: model.press,
                                    keyboardType: TextInputType.visiblePassword,
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                      hintText: "ادخل كلمة السر",
                                      suffixIcon: const Icon(Icons.lock),
                                      prefixIcon: IconButton(
                                          onPressed: () {
                                            model.changeIcon();
                                          },
                                          icon: model.eye),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(width: width * 0.01),
                                      ),
                                    ),
                                     validator: (value) {
                                          if (value!.isEmpty || value == null) {
                                            return 'كلمة المرور غير مدخلة';
                                          } else if (value.length < 8) {
                                            return 'طول كلمة المرور أٌقل من 8 محارف';
                                          } else {
                                            return null;
                                          }
                                        },
                                  );
                                },
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            transitionDuration:
                                                const Duration(seconds: 1),
                                            transitionsBuilder: (context, animation,
                                                secondaryAnimation, child) {
                                              return ScaleTransition(
                                                alignment: Alignment.center,
                                                scale: animation,
                                                child: child,
                                              );
                                            },
                                            pageBuilder: (context, animation,
                                                secondaryAnimation) {
                                              return  Sign_up();
                                            },
                                          ));
                                    },
                                    child: const Text("انشىء حساب"),
                                  ),
                                  InkWell(
                                    child: const Text(
                                      "هل نسيت كلمة السر ؟",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            transitionDuration:
                                                const Duration(seconds: 1),
                                            transitionsBuilder: (context, animation,
                                                secondaryAnimation, child) {
                                              return ScaleTransition(
                                                alignment: Alignment.center,
                                                scale: animation,
                                                child: child,
                                              );
                                            },
                                            pageBuilder: (context, animation,
                                                secondaryAnimation) {
                                              return  ForgetPass();
                                            },
                                          ));
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: height * 0.519,
                    left: width * 0.14,
                    child: InkWell(
                       onTap: (){
                         if (formKey.currentState!.validate()) {
                          const Snack =
                              SnackBar(content: Text("تم تسجيل الدخول بنجاح"));
                          ScaffoldMessenger.of(context).showSnackBar(Snack);
                       
                        }
                      },
                      child: Container(
                        width: width * 0.15,
                        height: height * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color.fromARGB(255, 203, 59, 62)),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: width * 0.09,
                        ),
                      ),
                    )),
                Positioned(
                    child: Container(
                  width: width,
                  height: height / 1.05,
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
