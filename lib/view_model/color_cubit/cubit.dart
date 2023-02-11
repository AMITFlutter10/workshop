import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop/controller/data/local/shared.dart';
import 'package:workshop/view_model/color_cubit/states.dart';
import '../../utilities/enums/enums.dart';

class ColorCubit extends Cubit<ColorState>{
  ColorCubit(): super(ColorInitial());
  static ColorCubit get(context)=>BlocProvider.of(context);

  bool isDarkTheme = false;
  void changeAppTheme(){
    isDarkTheme =!isDarkTheme;
    MyCache.putBool(key: MyCacheKey.theme, value: isDarkTheme);
   emit(ChangeColorTheme());
  }

  void getTheme(){
    isDarkTheme =MyCache.getBool(key: MyCacheKey.theme);
    emit(GetColorTheme());
  }



}