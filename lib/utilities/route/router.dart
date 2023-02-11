import 'package:flutter/material.dart';
import 'package:workshop/utilities/route/routes.dart';
import '../../view/pages/account/login_page.dart';
import '../../view/pages/onboarding_page.dart';
import '../../view/pages/splash_page.dart';

Route<dynamic> onGenerate(RouteSettings routeSettings){

  switch(routeSettings.name){
    case AppRoutes.splashPageRoute:
      return MaterialPageRoute(builder: (_)=>const SplashScreen(),
      settings:  routeSettings
      );
    case AppRoutes.onBoardingRoute:
      return MaterialPageRoute(builder: (_)=>
      const OnBoardingScreen(),
      settings: routeSettings
      );
    case AppRoutes.loginRoute:
   return MaterialPageRoute(builder: (_)=> LoginPage(),
          settings: routeSettings
      );
  case AppRoutes.registerPageRoute:
  default:return MaterialPageRoute(builder: (_)=> LoginPage(),
  settings: routeSettings
  );

  }

}