import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit_mode/state.dart';
import '../shared/network/cache_helper.dart';


class AppCubit extends Cubit<AppState>
{
AppCubit(): super(AppInitialState());
static AppCubit get(context) => BlocProvider.of(context);

bool isDark = false;
void changeMode({bool? fromShared})
{
  if (fromShared != null) {
    isDark = fromShared;
    emit(AppGetChangeModeState());
  } else {
    isDark = !isDark;
    CacheHelper.putData(key: 'isDark', value: isDark ).then((value){
      emit(AppGetChangeModeState());
    });
  }
}
}