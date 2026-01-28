
import 'package:flutter_riverpod/legacy.dart';

/*Este es el provider o el dato al que se van a suscribir los widgets
para reaccionar en base a los cambios de este  */
final counterProvider = StateProvider<int>((ref) => 5);