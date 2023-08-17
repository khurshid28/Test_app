import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

Future showCustomErrorAlert(BuildContext context, {required String? message}) async{
   return await QuickAlert.show(
      context: context,
      title: "Ошибка",
      text: message ?? "Что-то пошло не так !",
      type: QuickAlertType.error,
      confirmBtnText: "Понимаю",
      autoCloseDuration: Duration(seconds: 3)
    );
  
}


Future showCustomPasswordErrorAlert(BuildContext context,) async{
   return await QuickAlert.show(
      context: context,
      title: "Ошибка",
      text: "Минимум 8 символов для пароля!",
      type: QuickAlertType.error,
      confirmBtnText: "Понимаю",
      autoCloseDuration: Duration(seconds: 3)
    );
  
}

