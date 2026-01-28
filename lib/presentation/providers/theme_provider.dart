import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Estilo del tema
final isDarkModeProvider = StateProvider<bool>((ref) => false);

//Listado de los colores del tema
/*Este provider es inmutable o estatico siendo que no se puede
cambiar el valor de este cuando se inicie la aplicación pero si se puede leer */
final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider<int>((ref) => 1);

/*El stateNotifier es un provider que se usa para manear estados más complejos
que sería más que nada para el manejo de clases o manejar el estado de distintas
propiedades de una clase en concreto */
//El primer tipo de dato que manera es el que contrla el estado
//es el estado o clase que se manejara
final themeNotifierProvider = StateNotifierProvider((ref) => ThemeNotifier());

//Controller o Notifier del estado
class ThemeNotifier extends StateNotifier<AppTheme> {
  //STATE = Estado
  ThemeNotifier() : super(AppTheme());

  void toogleDakMode(){
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

    void changeColorIndex(int colorIndex){
    state = state.copyWith(selectedColor: colorIndex);
  }
}
