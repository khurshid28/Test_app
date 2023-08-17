import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/1_login_bloc.dart';

class LoginRepository {
  static Future request(BuildContext context,
      {required String password, required String email}) async {
    try {
      return await BlocProvider.of<LoginBloc>(context)
          .postLogin(password: password, email: email);
    } catch (e) {
      print(e);
      print("Error in LoginRepository");
      return null;
    }
  }
}
