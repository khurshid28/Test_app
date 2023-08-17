import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/constants/app_consts.dart';

TextFormField customTextField({required String hintText,required TextInputType keyboardType,required TextEditingController textEditingController,bool obscureText =false}) {
  return TextFormField(
    controller: textEditingController,
    cursorColor: AppConstant.activeItemColor,
    keyboardType: keyboardType,
    obscureText: obscureText,
    decoration: InputDecoration(
      
      border: InputBorder.none,
      hintText: hintText,
      hintStyle: TextStyle(
        color:Colors.grey ,
        fontSize: 17.sp,
        fontWeight: FontWeight.w500,
      )
      
    ),
  );
}
