import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../controller/data/local/shared.dart';
import '../../utilities/assets/app_assets.dart';
import '../../utilities/enums/enums.dart';
import 'home_screen.dart';
import 'onboarding_page.dart';


class SplashScreen  extends StatefulWidget{
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  bool loading = true;

  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4),
        MyCache.getBool(key: MyCacheKey.onBoarding)==false?
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
            const OnBoardingScreen()
            ))
            :  ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
            const HomePage()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          height: 200.h,
          width: 200.w,
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.splashing,),
              Text("Welcome :)",style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.purple[800],
                  fontWeight: FontWeight.bold
              ),)
            ],
          ),

          // Opacity(
          //     opacity: 0.5,
          //     child: Image.asset(AppAssets.lights,width: double.infinity,height: double.infinity,fit: BoxFit.fill,)),
        ),
      ),
    );
  }
}