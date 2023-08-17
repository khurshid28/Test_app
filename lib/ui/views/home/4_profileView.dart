import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/routes/route_names.dart';

import '../../../services/storage_service.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String nickname = "";
  String email = "";
  readData() async {
    final data = await Future.wait([
      StorageService().read(StorageService.nickname),
      StorageService().read(StorageService.email),
    ]);
    nickname = data[0] ?? "";
    email = data[1] ?? "";
    setState(() {});
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Profile".tr(),
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 48.h,
            ),
            SvgPicture.asset(
              "assets/icons/profile.svg",
              color: Colors.black,
              width: 84.w,
              height: 84.h,
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              nickname,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              email,
              style: TextStyle(
                color: Color(0xff929292),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            GestureDetector(
              onTap: () {
                deleteData();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouteNames.RegistrationView,
                  (route) => false,
                );
              },
              child: Container(
                width: 1.sw,
                height: 65.h,
                alignment: Alignment.centerLeft,
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: 22.w,
                ),
                child: Text(
                  "chiqish".tr(),
                  style: TextStyle(
                      color: Color(
                        0xffEC3A4D,
                      ),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future deleteData() async {
    await Future.wait([
      StorageService().remove(StorageService.accessToken),
      StorageService().remove(
        StorageService.refreshToken,
      ),
      StorageService().remove(
        StorageService.id,
      ),
      StorageService().remove(
        StorageService.email,
      ),
      StorageService().remove(
        StorageService.nickname,
      ),
    ]);
  }
}
