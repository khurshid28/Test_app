import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/bloc/1_login_bloc.dart';
import 'package:test_app/bloc/data_state.dart';
import 'package:test_app/repository/login_repository.dart';
import 'package:test_app/routes/route_names.dart';
import 'package:test_app/services/loading_service.dart';
import 'package:test_app/services/storage_service.dart';
import 'package:quickalert/quickalert.dart';
import 'package:test_app/ui/widgets/alert_widgets.dart';

import '../widgets/button_widgets.dart';
import '../widgets/field_widgets.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoadingService loadingService = LoadingService();
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Registration View".tr(),
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocListener<LoginBloc, DataState>(
              listener: (context, state) async{
                if (state is DataWaiting) {
                  loadingService.showLoading(context);
                } else if (state is DataSuccess) {
                  loadingService.closeLoading(context);
                  await savedData(user: state.data["user"], tokens: state.data["tokens"]);
                  Navigator.pushReplacementNamed(
                    context,
                    RouteNames.HomeView,
                  );
                } else if (state is DataError) {
                  loadingService.closeLoading(context);
                  // error alert
                  showCustomErrorAlert(context, message: state.error!.message);
                }
              },
              child: SizedBox(),
            ),
            Container(
              width: 1.sw,
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 65.h,
                    width: 1.sw,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    color: Colors.white,
                    child: customTextField(
                      hintText: "Логин или почта",
                      keyboardType: TextInputType.emailAddress,
                      textEditingController: emailController,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    child: Divider(
                      height: 3.h,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Container(
                    height: 65.h,
                    width: 1.sw,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    color: Colors.white,
                    child: customTextField(
                      hintText: "Пароль",
                      keyboardType: TextInputType.name,
                      textEditingController: passwordController,
                      
                      obscureText: true,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 90.h,
            ),
            customButton(
              onPressed: () {
                if (passwordController.text.length > 7 &&
                    emailController.text.isNotEmpty) {
                  LoginRepository.request(
                    context,
                    password: passwordController.text,
                    email: emailController.text,
                  );
                } else if (passwordController.text.length < 8) {
                  // min 8 password length error
                  showCustomPasswordErrorAlert(context);
                }
              },
              text: "kirish".tr(),
            ),
            SizedBox(
              height: 16.h,
            ),
            customButton(
              onPressed: () {},
              text: "registratsiya qilish".tr(),
            ),
          ],
        ),
      ),
    );
  }

  Future savedData({required Map user, required Map tokens}) async {
    await Future.wait([
      StorageService().write(StorageService.accessToken, tokens["accessToken"]),
      StorageService()
          .write(StorageService.refreshToken, tokens["refreshToken"]),
      StorageService().write(StorageService.id, user["id"]),
      StorageService().write(StorageService.email, user["email"]),
      StorageService().write(StorageService.nickname, user["nickname"]),
    ]);
    
  }
}
