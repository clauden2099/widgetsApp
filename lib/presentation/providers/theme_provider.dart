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


