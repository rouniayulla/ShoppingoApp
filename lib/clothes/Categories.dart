import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});
 

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
   var categWomen=[
    ["assets/11.jpeg","قبعات",false],
    ["assets/12.jpg","فستان",false],
    ["assets/13.jpg","تنورة",false],
    ["assets/14.jpeg","بنطال",false],
    ["assets/13.jpg","تنورة",false],
    ["assets/14.jpeg","بنطال",false],
  ];
    bool _isPressed = false;
  Widget build(BuildContext context) {
   var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child:Row(
      
        children: [
          for(int i=0;i<categWomen.length;i++)
          AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          margin: EdgeInsets.only(bottom: categWomen[i][2] as bool ? height*0.02 : height*0.02 ),
          width: categWomen[i][2] as bool ? width*0.4: width*0.38,
          height: categWomen[i][2] as bool ? height*0.07 : height*0.065,
          decoration: BoxDecoration(
           
            borderRadius:
               BorderRadius.circular(categWomen[i][2] as bool ? width*0.02 :  width*0.01),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: categWomen[i][2] as bool ? 7 : 2,
                
              ),
            ],
          ),
         child:InkWell(
         onTap: () {
              setState(() {
                _isPressed=categWomen[i][2] as bool;
                categWomen[i][2] =!_isPressed;
              });
            },
           
            child: Container(
              margin:EdgeInsets.symmetric(horizontal:width*0.02),
              padding:EdgeInsets.symmetric(vertical:height*0.003,horizontal:width*0.05),
              
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius:BorderRadius.circular(width*0.04),
                border:Border.all(
                  color:categWomen[i][2] as bool?Color.fromARGB(255, 47, 27, 139):Color.fromARGB(255, 47, 27, 139),
                  width:categWomen[i][2] as bool?width*0.009:width*0.005
                )
              ),
              child:Row(crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                 Text(categWomen[i][1].toString(),style:TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize:width*0.045,
                  color: Color.fromARGB(250, 203, 59, 62)
                )),
                SizedBox(width:width*0.02),
                Image.asset(
                  categWomen[i][0].toString(),
          width:width*0.08,
          height:height*0.069
          
                ),
               
              ],
              ),),
          ))
        ],
      ),
    );
  }
}