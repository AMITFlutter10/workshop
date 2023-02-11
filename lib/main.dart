import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:workshop/utilities/route/router.dart';
import 'package:workshop/utilities/route/routes.dart';
import 'package:workshop/utilities/themes/theme.dart';
import 'package:workshop/view_model/color_cubit/cubit.dart';
import 'package:workshop/view_model/color_cubit/states.dart';
import 'controller/data/local/shared.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.init();

  runApp((MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>ColorCubit())
      ], child: const MyApp())
      ));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorCubit,ColorState>(
      builder: (context, state)
    {
      return Sizer(builder: (context, orientation, deviceType) {
        ColorCubit cubit = ColorCubit.get(context);
        cubit.getTheme();
        return MaterialApp(
          // title: 'Flutter Demo',
          // theme: ThemeData(
          //   primarySwatch: Colors.blue,
          // ),
          theme: cubit.isDarkTheme ? Themes.darkTheme : Themes.lightTheme,
          // home: LoginPage()
          onGenerateRoute: onGenerate,
          initialRoute: AppRoutes.splashPageRoute,
          //   home: LoginPage()
        );
      });
    });
  }
}
