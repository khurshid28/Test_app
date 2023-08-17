import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/1_login_bloc.dart';
import 'routes/route_names.dart';
import 'routes/routes.dart';
import 'ui/widgets/main/build_widget.dart';

// ignore: must_be_immutable
class TestApp extends StatelessWidget {
  bool isHome;
  TestApp(this.isHome);

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: [
        Locale('en', 'EN'),
        Locale('ru', 'RU'),
      ],
      path: 'assets/languages',
      fallbackLocale: Locale('ru', 'RU'),
      child: ScreenUtilInit(
        designSize: const Size(390, 844), // iphone 11 ppro max's size
        // minTextAdapt: true,
        // splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: providers,
            child: CupertinoApp(
              // scrollBehavior:  MobileLikeScrollBehavior(),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              initialRoute: isHome ? RouteNames.HomeView: RouteNames.RegistrationView,
              onGenerateRoute: Routes.ongenerateRoute,
              builder: materialAppCustomBuilder,
              theme: CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
                  textStyle: TextStyle(
                    fontFamily:  'Manrope'
                  )
                ),
                applyThemeToAll: true
              ),
            ),
          );
        },
      ),
    );
  }
}

List<BlocProvider> providers = [
  BlocProvider<LoginBloc>(
    create: (context) => LoginBloc(),
    lazy: false,
  ),
];
