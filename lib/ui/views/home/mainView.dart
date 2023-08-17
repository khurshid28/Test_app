import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/button_widgets.dart';
import '1_ribbonView.dart';
import '2_mapView.dart';
import '3_savedView.dart';
import '4_profileView.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> views = [
    RibbonView(),
    MapView(),
    SavedView(),
    ProfileView(),
  ];
  List<String> texts = [
    "Ribbon",
    "Map",
    "Saved",
    "Profile",
  ];
  List<String> images = [
    "ribbon",
    "map",
    "saved",
    "profile",
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: views[selectedIndex],
        bottomNavigationBar: Container(
          height: 67.h,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              views.length,
              (index) => bottomNavigationButton(
                text: texts[index].tr(),
                image: images[index],
                isSelected: index == selectedIndex,
                onPressed: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
